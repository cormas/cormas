"
I am a sensitivity analysis: I run a simulation many times, with other parameter values and seeds, and save every run with a summary of their final values.

## Responsibility:

- I know the settings my runs share (those of a `CMSimulation`), the parameters I vary and their values, my design, my number of replicates and my master seed.
- I run each combination of parameter values once per replicate, replicate k having the same seed in every combination, and set the parameters back afterwards.
- I save myself in one folder: `analysis.json` (the design), a folder per run, `results.csv` (the last recorded values of the model probes) and a `results-<Class>.csv` per recorded entity class.

## Collaborators:

- `CMSimulation`: gives each run its settings through `newSimulationWithSameSettings`, runs it and saves it.
- `CMRunMetadata`: describes the settings shared by the runs in `analysis.json`.
- `CMLastStepRecording` and `CMIntervalRecording`: say which steps each run records, the last one only unless `recordEvery:` is sent.

## Public API and Key Messages

- `on:` creates an analysis on a simulation, whose settings each run takes.
- `parameter:of:values:` varies a parameter of the model or of an entity class.
- `beFullFactorial` (the default) or `beOneFactorAtATime`, `replicates:`, `masterSeed:`, `recordEvery:`.
- `run` and `runIn:` run in this process and return the folder of the analysis; `runInBackground` runs in another one, and `pause`, `resume` and `stop` act between runs.
- `results`, `numberOfRuns`, `numberOfCompletedRuns`, `whenProgressDo:` and `whenFinishedDo:` follow it.
- `outputs`, `resultsVarying:` and `resultsGroupedBy:` give the data of the views of its results, which `canvasOf:against:` and `canvasOf:against:groupedBy:` draw.

```
| simulation |
simulation := (CMSimulation for: FFFirefightersModel new)
	activeInitSelector: #initSmall;
	activeControlSelector: #basicStep;
	stopAfterStep: 20;
	yourself.
(CMSensitivityAnalysis on: simulation)
	parameter: #numberOfFirefighters of: FFFirefightersModel values: #( 1 5 10 );
	replicates: 5;
	masterSeed: 42;
	run
```

## Internal Representation

- `factors`: the varied parameters, as associations of a class and a getter, with their values.
- `results` and `classResults`: a row per run, and per class a row per instance and run, each an `OrderedDictionary` from column names to values.
- `shouldPause`, `shouldStop` and `pauseSemaphore` let another process pause or stop the runs.
"
Class {
	#name : 'CMSensitivityAnalysis',
	#superclass : 'Object',
	#instVars : [
		'simulation',
		'factors',
		'isOneFactorAtATime',
		'replicates',
		'masterSeed',
		'recordedSteps',
		'results',
		'classResults',
		'numberOfCompletedRuns',
		'isRunning',
		'shouldStop',
		'shouldPause',
		'pauseSemaphore',
		'whenProgressBlock',
		'whenFinishedBlock'
	],
	#category : 'Cormas-Core-SensitivityAnalysis',
	#package : 'Cormas-Core',
	#tag : 'SensitivityAnalysis'
}

{ #category : 'instance creation' }
CMSensitivityAnalysis class >> on: aSimulation [
	"Return an analysis whose runs take the settings of aSimulation"

	^ self new
		  setSimulation: aSimulation;
		  yourself
]

{ #category : 'private' }
CMSensitivityAnalysis >> add: aTableRow named: probes to: aRow [
	"Add to aRow the step and the values of aTableRow, a row of a CMDataTable whose columns are probes"

	aRow at: 'step' put: aTableRow first.
	probes
		with: aTableRow allButFirst
		do: [ :probe :value | aRow at: probe asString put: value ]
]

{ #category : 'private' }
CMSensitivityAnalysis >> addResultsOf: aSimulation described: anArray [
	"Add a row of the last recorded values of the model of aSimulation, and one for each instance whose class is recorded, starting with anArray"

	| row |
	row := self rowStartingWith: anArray.
	self
		add: aSimulation modelData rows last
		named: aSimulation modelData columnNames
		to: row.
	results add: row.
	aSimulation recordedClasses do: [ :aClass |
			| rows |
			rows := classResults
				        at: aClass
				        ifAbsentPut: [ OrderedCollection new ].
			(aSimulation dataByIdOfClass: aClass) keys sorted do: [ :id |
					| table |
					table := (aSimulation dataByIdOfClass: aClass) at: id.
					table rows ifNotEmpty: [ :tableRows |
							row := (self rowStartingWith: anArray)
								       at: 'id' put: id;
								       at: 'label' put: table label;
								       yourself.
							self add: tableRows last named: table columnNames to: row.
							rows add: row ] ] ]
]

{ #category : 'settings' }
CMSensitivityAnalysis >> beFullFactorial [
	"Run every combination of the values of the parameters"

	isOneFactorAtATime := false
]

{ #category : 'settings' }
CMSensitivityAnalysis >> beOneFactorAtATime [
	"Vary each parameter over its values, the others keeping their values in the simulation"

	isOneFactorAtATime := true
]

{ #category : 'views' }
CMSensitivityAnalysis >> canGroupResults [
	"Return whether my results can be grouped by a parameter: only a full factorial of several parameters varies them together"

	^ isOneFactorAtATime not and: [ factors size > 1 ]
]

{ #category : 'private' }
CMSensitivityAnalysis >> columnNames [
	"Return the names of the columns describing a run: its number, replicate and seed, then my parameters, qualified by their class when it is an entity class"

	^ #( 'run' 'replicate' 'seed' ) , (factors keys collect: [ :each |
			   each key = self modelClass
				   ifTrue: [ each value asString ]
				   ifFalse: [ each key name , '.' , each value ] ])
]

{ #category : 'private' }
CMSensitivityAnalysis >> combinations [
	"Return the values of my parameters, in their order, for each combination of my design"

	^ isOneFactorAtATime
		  ifTrue: [ self oneFactorAtATimeCombinations ]
		  ifFalse: [ self fullFactorialCombinations ]
]

{ #category : 'private' }
CMSensitivityAnalysis >> fullFactorialCombinations [

	^ factors values inject: #( #(  ) ) into: [ :combinations :values |
			  combinations flatCollect: [ :each |
				  values collect: [ :value | each copyWith: value ] ] ]
]

{ #category : 'initialization' }
CMSensitivityAnalysis >> initialize [

	super initialize.
	factors := OrderedDictionary new.
	isOneFactorAtATime := false.
	replicates := 1.
	masterSeed := Random new nextInteger: SmallInteger maxVal.
	recordedSteps := CMLastStepRecording new.
	results := OrderedCollection new.
	classResults := Dictionary new.
	numberOfCompletedRuns := 0.
	isRunning := false.
	shouldStop := false.
	shouldPause := false.
	pauseSemaphore := Semaphore new.
	whenProgressBlock := [ :analysis | "do nothing" ].
	whenFinishedBlock := [ :analysis | "do nothing" ]
]

{ #category : 'accessing' }
CMSensitivityAnalysis >> isPaused [

	^ shouldPause
]

{ #category : 'accessing' }
CMSensitivityAnalysis >> isRunning [

	^ isRunning
]

{ #category : 'private' }
CMSensitivityAnalysis >> jsonWith: aRunMetadata [
	"Return the JSON object of analysis.json: the settings that my runs share, as aRunMetadata has them, then my design"

	| factorValues |
	factorValues := OrderedDictionary new.
	factors keysAndValuesDo: [ :factor :values |
			(factorValues
				 at: factor key name
				 ifAbsentPut: [ OrderedDictionary new ])
				at: factor value
				put: values copy ].
	^ aRunMetadata asDictionary
		  removeKey: 'seed';
		  removeKey: 'lastStep';
		  at: 'design'
		  put: (Dictionary with: 'type' -> (isOneFactorAtATime
							    ifTrue: [ 'oneFactorAtATime' ]
							    ifFalse: [ 'fullFactorial' ]));
		  at: 'factors' put: factorValues;
		  at: 'replicates' put: replicates;
		  at: 'masterSeed' put: masterSeed;
		  yourself
]

{ #category : 'accessing' }
CMSensitivityAnalysis >> masterSeed [

	^ masterSeed
]

{ #category : 'settings' }
CMSensitivityAnalysis >> masterSeed: anInteger [
	"Choose the seeds of the replicates from anInteger, so that the same master seed gives the same seeds"

	masterSeed := anInteger
]

{ #category : 'accessing' }
CMSensitivityAnalysis >> modelClass [

	^ simulation cormasModel class
]

{ #category : 'private' }
CMSensitivityAnalysis >> newRun [
	"Return a new simulation with the settings of my simulation, recording the steps I record"

	^ simulation newSimulationWithSameSettings
		  recordedSteps: recordedSteps;
		  yourself
]

{ #category : 'accessing' }
CMSensitivityAnalysis >> numberOfCompletedRuns [

	^ numberOfCompletedRuns
]

{ #category : 'accessing' }
CMSensitivityAnalysis >> numberOfRuns [

	^ self combinations size * replicates
]

{ #category : 'private' }
CMSensitivityAnalysis >> oneFactorAtATimeCombinations [

	| parameterValues inSimulation |
	parameterValues := simulation cormasModel parameterValues.
	inSimulation := factors keys collect: [ :each |
		                (parameterValues at: each key name) at: each value ].
	^ (1 to: factors size) flatCollect: [ :index |
			  (factors values at: index) collect: [ :value |
					  inSimulation copy
						  at: index put: value;
						  yourself ] ]
]

{ #category : 'views' }
CMSensitivityAnalysis >> outputs [
	"Return the names of the model probes my runs record, the outputs my views show"

	^ (simulation recordedProbesOf: self modelClass) collect: [ :each |
		  each asString ]
]

{ #category : 'settings' }
CMSensitivityAnalysis >> parameter: aSelector of: aClass values: aCollection [
	"Vary the parameter aSelector of aClass, the model's class or one of its entity classes, over the values of aCollection"

	((simulation cormasModel parameterValues
		  at: aClass name
		  ifAbsent: [ Dictionary new ]) includesKey: aSelector) ifFalse: [
		self error: aClass name , ' has no parameter ' , aSelector ].
	factors at: aClass -> aSelector put: aCollection asArray
]

{ #category : 'views' }
CMSensitivityAnalysis >> parameterNames [
	"Return the names of the columns of my parameters in my results"

	^ self columnNames allButFirst: 3
]

{ #category : 'private' }
CMSensitivityAnalysis >> parameterValuesOf: aCombination [
	"Return the values of aCombination by class name, then by getter, as parameterValues returns them"

	| values |
	values := OrderedDictionary new.
	factors keys with: aCombination do: [ :factor :value |
			(values at: factor key name ifAbsentPut: [ OrderedDictionary new ])
				at: factor value
				put: value ].
	^ values
]

{ #category : 'running' }
CMSensitivityAnalysis >> pause [
	"Wait before the next run until resume is sent"

	shouldPause := true
]

{ #category : 'accessing' }
CMSensitivityAnalysis >> progress [
	"Return the fraction of the runs done"

	self numberOfRuns = 0 ifTrue: [ ^ 0 ].
	^ numberOfCompletedRuns / self numberOfRuns
]

{ #category : 'settings' }
CMSensitivityAnalysis >> recordEvery: anInteger [
	"Record the data of each run at init, every anInteger steps, and at the last step, rather than at the last step only"

	recordedSteps := CMIntervalRecording every: anInteger
]

{ #category : 'settings' }
CMSensitivityAnalysis >> recordedSteps: aStepsRecording [
	"Record the data of each run at the steps aStepsRecording chooses"

	recordedSteps := aStepsRecording
]

{ #category : 'settings' }
CMSensitivityAnalysis >> replicates: anInteger [
	"Run each combination of parameter values anInteger times, replicate k having the same seed in every combination"

	replicates := anInteger
]

{ #category : 'accessing' }
CMSensitivityAnalysis >> results [
	"Return a row for each run done: its number, replicate, seed and parameter values, then the last recorded step and the value of each model probe at that step"

	^ results
]

{ #category : 'views' }
CMSensitivityAnalysis >> resultsGroupedBy: aParameterName [
	"Return the results of the runs grouped by the value of the parameter named aParameterName, in the order of its values. Only a full factorial varies several parameters in the same runs"

	| groups |
	isOneFactorAtATime ifTrue: [
			self error:
				'Only a full factorial varies several parameters together, so that its results can be grouped by one of them' ].
	groups := OrderedDictionary new.
	(factors values at: (self parameterNames indexOf: aParameterName))
		do: [ :each | groups at: each put: OrderedCollection new ].
	results do: [ :row | (groups at: (row at: aParameterName)) add: row ].
	^ groups
]

{ #category : 'views' }
CMSensitivityAnalysis >> resultsVarying: aParameterName [
	"Return the results of the runs that vary the parameter named aParameterName: all of them in a full factorial, the runs of its values in one factor at a time"

	| index runsBefore runs |
	isOneFactorAtATime ifFalse: [ ^ results ].
	index := self parameterNames indexOf: aParameterName.
	runsBefore := ((factors values first: index - 1)
		               inject: 0
		               into: [ :sum :each | sum + each size ]) * replicates.
	runs := (factors values at: index) size * replicates.
	^ results select: [ :row |
		  (row at: 'run') between: runsBefore + 1 and: runsBefore + runs ]
]

{ #category : 'running' }
CMSensitivityAnalysis >> resume [

	shouldPause := false.
	pauseSemaphore signal
]

{ #category : 'private' }
CMSensitivityAnalysis >> rowStartingWith: anArray [

	| row |
	row := OrderedDictionary new.
	self columnNames
		with: anArray
		do: [ :name :value | row at: name put: value ].
	^ row
]

{ #category : 'running' }
CMSensitivityAnalysis >> run [
	"Run the analysis in this process and save it in the output folder of the model's folder, as runIn: does. Return the folder of the analysis"

	^ self runIn: self modelClass folder / 'output'
]

{ #category : 'private' }
CMSensitivityAnalysis >> run: anArray in: aRunFolder [
	"Do the run described by anArray: its number, replicate and seed, then the values of my parameters. Save it in aRunFolder and add its results"

	| run |
	run := self newRun.
	run cormasModel parameterValues:
		(self parameterValuesOf: (anArray allButFirst: 3)).
	run
		randomSeed: anArray third;
		initializeSimulation;
		runUntilStopped;
		saveDataTo: aRunFolder.
	self addResultsOf: run described: anArray
]

{ #category : 'private' }
CMSensitivityAnalysis >> runAllIn: aFolder restoring: parameterValues [
	"Do each run, saved in a folder of aFolder, and set the parameters back to parameterValues after it"

	| seeds digits number |
	seeds := self seeds.
	digits := self numberOfRuns printString size.
	number := 0.
	self combinations do: [ :combination |
			seeds withIndexDo: [ :seed :replicate |
					self waitWhilePaused.
					shouldStop ifTrue: [ ^ self ].
					number := number + 1.
					[
						self
							run: {
									number.
									replicate.
									seed } , combination
							in:
							aFolder / ('run-' , (number printPaddedWith: $0 to: digits)) ]
						ensure: [
						simulation cormasModel parameterValues: parameterValues ].
					numberOfCompletedRuns := numberOfCompletedRuns + 1.
					whenProgressBlock value: self ] ]
]

{ #category : 'running' }
CMSensitivityAnalysis >> runIn: aFolder [
	"Run the analysis in this process and save it in a new folder of aFolder, named after when it started: the design as analysis.json, each run in a folder of its own, the results of the model as results.csv and of each class with recorded instances as results-<Class>.csv. Return the folder of the analysis"

	| parameterValues metadata folder |
	parameterValues := simulation cormasModel parameterValues.
	metadata := self newRun newRunMetadata.
	folder := aFolder / (metadata folderName , ' analysis').
	folder exists ifTrue: [
		CMRecordingError signal: folder fullName , ' already exists' ].
	folder ensureCreateDirectory.
	folder / 'analysis.json' writeStreamDo: [ :stream |
		STONJSON put: (self jsonWith: metadata) onStreamPretty: stream ].
	results := OrderedCollection new.
	classResults := Dictionary new.
	numberOfCompletedRuns := 0.
	shouldStop := false.
	isRunning := true.
	[ self runAllIn: folder restoring: parameterValues ] ensure: [
			self writeResultsIn: folder.
			isRunning := false.
			whenFinishedBlock value: self ].
	^ folder
]

{ #category : 'running' }
CMSensitivityAnalysis >> runInBackground [
	"Run the analysis in another process, as run does"

	[ self run ] fork
]

{ #category : 'private' }
CMSensitivityAnalysis >> seeds [
	"Return the seed of each replicate, chosen from my master seed"

	| generator |
	generator := CMSimulationContext defaultRandomNumberGeneratorClass
		             new
		             seed: masterSeed;
		             yourself.
	^ (1 to: replicates) collect: [ :each |
		  generator nextInteger: SmallInteger maxVal ]
]

{ #category : 'initialization' }
CMSensitivityAnalysis >> setSimulation: aSimulation [

	simulation := aSimulation
]

{ #category : 'running' }
CMSensitivityAnalysis >> stop [
	"Do no more runs after the current one"

	shouldStop := true.
	shouldPause := false.
	pauseSemaphore signal
]

{ #category : 'private' }
CMSensitivityAnalysis >> waitWhilePaused [

	[ shouldPause ] whileTrue: [ pauseSemaphore wait ]
]

{ #category : 'settings' }
CMSensitivityAnalysis >> whenFinishedDo: aBlock [
	"Evaluate aBlock with me when my runs are done or stopped"

	whenFinishedBlock := aBlock
]

{ #category : 'settings' }
CMSensitivityAnalysis >> whenProgressDo: aBlock [
	"Evaluate aBlock with me after each run"

	whenProgressBlock := aBlock
]

{ #category : 'private' }
CMSensitivityAnalysis >> writeCsvOf: rows on: aStream [

	rows ifEmpty: [ ^ self ].
	aStream
		nextPutAll: (',' join: rows first keys);
		lf.
	rows do: [ :each |
		CMDataTable writeCsvValues: each values on: aStream ]
]

{ #category : 'private' }
CMSensitivityAnalysis >> writeResultsIn: aFolder [

	aFolder / 'results.csv' writeStreamDo: [ :stream |
		self writeCsvOf: results on: stream ].
	classResults keysAndValuesDo: [ :aClass :rows |
			aFolder / ('results-' , aClass name , '.csv') writeStreamDo: [
				:stream | self writeCsvOf: rows on: stream ] ]
]
