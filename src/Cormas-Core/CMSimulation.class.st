"
I am one simulation of a model: I initialize it with an init method, run it step by step with a control method until a stop condition holds, and record the data measured by its probes.

## Responsibility:

- I know the settings of the simulation: the init and control methods, the random seed, the stop condition and what is recorded.
- I record, at init, every recording interval and at the last step, the probes of the model in its data, and the probes of each entity in the data of that entity.
- I run the steps, in the background or one at a time.

## Collaborators:

- `CMModel` is the model I simulate; its `<probe>` methods, and those of its entity classes, are what I record.
- `CMDataTable` holds the data of the model and of each recorded entity.
- `CMSimulationProcessRunner` runs my steps in the background and holds the stop condition.
- `CMSimulationContext` holds the current step and the random numbers.

## Public API and Key Messages

- `CMSimulation for: aModel` creates a simulation; `activeInitSelector:`, `activeControlSelector:`, `stopWhen:` or `stopAfterStep:` set it up.
- `initializeSimulation`, `runStep` and `runAllSteps` run it.
- `recordEvery:`, `doNotRecord:`, `doNotRecord:of:`, `doNotRecordEntity:`, `record:` and `record:of:` choose what is recorded; everything is recorded by default.
- `modelData`, `dataOf:` (the model or an entity) and `dataOfAll:` return the recorded data; `writeCsvOfClass:on:` writes the data of all instances of a class as CSV.

```smalltalk
| simulation |
simulation := (CMSimulation for: CMMockModel new)
	activeInitSelector: #initFixed;
	activeControlSelector: #step;
	recordEvery: 2;
	doNotRecord: CMMockCell;
	yourself.
simulation initializeSimulation.
10 timesRepeat: [ simulation runStep ].
simulation modelData column: #numberOfAliveCells
```

## Internal Representation

- `modelData`: the `CMDataTable` of the model.
- `entityData`: a `Dictionary` from entity classes to a `Dictionary` from ids to the `CMDataTable` of each entity.
- `probes`: the recorded probes of the model; `recordedProbes`: a `Dictionary` from entity classes to their recorded probes. Both are chosen at init.
- `excludedClasses`, `excludedProbes` (class -> selector) and `excludedEntities` (class -> id): the recording switches.

### Implementation Points

- Class and probe switches apply from the next init. An entity switch applies from the next recorded step, and since ids are numbered in the same order at each init, it also applies after a new init.
"
Class {
	#name : 'CMSimulation',
	#superclass : 'Object',
	#instVars : [
		'cormasModel',
		'context',
		'activeInitSelector',
		'activeControlSelector',
		'probes',
		'initialParameterValues',
		'hasFixedRandomSeed',
		'shouldReleaseRandomSeedAfterInitialization',
		'simulationRunner',
		'modelData',
		'entityData',
		'recordedProbes',
		'excludedClasses',
		'excludedProbes',
		'excludedEntities',
		'recordingInterval'
	],
	#category : 'Cormas-Core-Kernel',
	#package : 'Cormas-Core',
	#tag : 'Kernel'
}

{ #category : 'time' }
CMSimulation class >> defaultFinalTimeStep [

	^ 100
]

{ #category : 'instance creation' }
CMSimulation class >> for: aModel [

	^ self new
		cormasModel: aModel;
		yourself
]

{ #category : 'settings' }
CMSimulation >> activeControlSelector: aSymbol [

	activeControlSelector := aSymbol
]

{ #category : 'accessing' }
CMSimulation >> activeInitSelector [

	^ activeInitSelector
]

{ #category : 'settings' }
CMSimulation >> activeInitSelector: aSymbol [

	activeInitSelector := aSymbol
]

{ #category : 'accessing' }
CMSimulation >> cormasModel [
	
	^ cormasModel
]

{ #category : 'accessing' }
CMSimulation >> cormasModel: aModel [

	cormasModel := aModel.
	context := cormasModel simulationContext
]

{ #category : 'accessing' }
CMSimulation >> currentTimeStep [

	^ context currentTimeStep 
]

{ #category : 'recording' }
CMSimulation >> dataOf: aRecordedObject [
	"Return the data recorded on aRecordedObject, the model or one of its entities: a CMDataTable with a row for each recorded step while it was alive"

	aRecordedObject == cormasModel ifTrue: [ ^ modelData ].
	^ (entityData at: aRecordedObject class ifAbsent: [ Dictionary new ])
		  at: aRecordedObject id
		  ifAbsent: [
				  CMRecordingError signal:
					  aRecordedObject printString , ' was not recorded' ]
]

{ #category : 'recording' }
CMSimulation >> dataOfAll: aClass [
	"Return the data recorded on each instance of aClass and of its subclasses, class by class in the order of their names, and in the order of the ids of their instances"

	| classes |
	classes := (recordedProbes keys select: [ :each |
		            each includesBehavior: aClass ]) sorted: [ :a :b |
		           a name < b name ].
	classes ifEmpty: [
		CMRecordingError signal: aClass name , ' is not recorded' ].
	^ classes flatCollect: [ :each | self dataOfClass: each ]
]

{ #category : 'private' }
CMSimulation >> dataOfClass: aClass [

	| tables |
	tables := entityData at: aClass ifAbsent: [ ^ #(  ) ].
	^ tables keys sorted collect: [ :each | tables at: each ]
]

{ #category : 'simulation runner - init' }
CMSimulation >> defaultStopCondition [
	"Be careful when modifying the stop condition because it can make the simulation (including the tests) run endlesly"
	^ [ :model |
		model currentTimeStep >=
		self class defaultFinalTimeStep ]
]

{ #category : 'recording' }
CMSimulation >> doNotRecord: aClass [
	"From the next init, record nothing of the model or the entities of aClass and of its subclasses"

	excludedClasses add: aClass
]

{ #category : 'recording' }
CMSimulation >> doNotRecord: aSelector of: aClass [
	"From the next init, do not record the probe aSelector of aClass and of its subclasses"

	(aClass probeSelectors includes: aSelector) ifFalse: [
			self error: ('{1} has no probe #{2}' format: {
						 aClass name.
						 aSelector }) ].
	excludedProbes add: aClass -> aSelector
]

{ #category : 'recording' }
CMSimulation >> doNotRecordEntity: anEntity [
	"From the next recorded step, record nothing more of anEntity. As ids are numbered in the same order at each init, the entity with the same id is not recorded after a new init either"

	excludedEntities add: anEntity class -> anEntity id
]

{ #category : 'testing' }
CMSimulation >> hasFixedRandomSeed [

	^ hasFixedRandomSeed
]

{ #category : 'testing' }
CMSimulation >> hasFixedRandomSeed: aBoolean [

	hasFixedRandomSeed := aBoolean
]

{ #category : 'accessing' }
CMSimulation >> incrementCurrentTimeStep [

	context currentTimeStep: context currentTimeStep + 1
]

{ #category : 'settings' }
CMSimulation >> initialParameterValues [

	^ initialParameterValues
]

{ #category : 'initialization' }
CMSimulation >> initialize [

	super initialize.

	probes := #(  ).
	modelData := CMDataTable withColumns: probes.
	entityData := Dictionary new.
	recordedProbes := Dictionary new.
	excludedClasses := Set new.
	excludedProbes := Set new.
	excludedEntities := Set new.
	recordingInterval := 1.
	initialParameterValues := Dictionary new.

	hasFixedRandomSeed := false.
	shouldReleaseRandomSeedAfterInitialization := false.

	self initializeSimulationRunner
]

{ #category : 'initialization' }
CMSimulation >> initializeProbes [
	"Choose the probes to record on the model and on the entities of each class, from the probe methods and the recording switches"

	probes := self recordedProbesOf: cormasModel class.
	recordedProbes := Dictionary new.
	cormasModel class allEntityClasses do: [ :each |
			(self recordedProbesOf: each) ifNotEmpty: [ :selectors |
				recordedProbes at: each put: selectors ] ]
]

{ #category : 'initialization' }
CMSimulation >> initializeSimulation [
	"Purpose: initialize one simulation by performing #activeInitSelector.
Reset the currentTimeStep and the data. Set the randomSeed"

	context currentTimeStep: 0.
	self hasFixedRandomSeed ifFalse: [ "Choose a new random seed every time the simulation is initialized. If random seed is fixed, then we will always initialize the same scenario"
		context chooseRandomSeedAtRandom ].
	self initializeProbes.
	modelData := CMDataTable withColumns: probes.
	entityData := Dictionary new.
	cormasModel initEntities.
	self setInitialParameters.
	cormasModel perform: activeInitSelector.
	self recordData.
	shouldReleaseRandomSeedAfterInitialization ifTrue: [
		context chooseRandomSeedAtRandom ]
]

{ #category : 'simulation runner - init' }
CMSimulation >> initializeSimulationRunner [

	simulationRunner := CMSimulationProcessRunner new
		cormasSimulation: self;
		stopCondition: self defaultStopCondition
]

{ #category : 'simulation runner - config' }
CMSimulation >> intervalDelay: aNumberOfMilliseconds [

	simulationRunner intervalDelay: aNumberOfMilliseconds
]

{ #category : 'simulation runner - testing' }
CMSimulation >> isSimulationProcessConfigured [

	^ simulationRunner isProcessConfigured
]

{ #category : 'simulation runner - testing' }
CMSimulation >> isSimulationRunning [ 

	^ simulationRunner isSimulationRunning
]

{ #category : 'data' }
CMSimulation >> isStepToRecord [
	"Init, every recording interval, and the last step are recorded"

	| step |
	step := self currentTimeStep.
	^ step = 0 or: [
			  step \\ recordingInterval = 0 or: [
				  simulationRunner stopCondition value: cormasModel ] ]
]

{ #category : 'data' }
CMSimulation >> modelData [

	"Return the data recorded on the model: a CMDataTable with a row for each recorded step"

	^ modelData
]

{ #category : 'simulation runner - running' }
CMSimulation >> pause [

	simulationRunner pause
]

{ #category : 'accessing' }
CMSimulation >> probes [

	^ probes
]

{ #category : 'settings' }
CMSimulation >> randomSeed: aNumber [

	context randomSeed: aNumber.
	
	"If user calls this method to set the random seed, it means that they want to fix it. Otherwise, if we don't fix it, the new random seed will be selected when the simulation is initialized and this number will be lost"
	self hasFixedRandomSeed: true
	
]

{ #category : 'recording' }
CMSimulation >> record: aClass [
	"From the next init, record again the model or the entities of aClass"

	excludedClasses remove: aClass ifAbsent: [ ]
]

{ #category : 'recording' }
CMSimulation >> record: aSelector of: aClass [
	"From the next init, record again the probe aSelector of aClass"

	excludedProbes remove: aClass -> aSelector ifAbsent: [ ]
]

{ #category : 'data' }
CMSimulation >> recordData [
	"At a step to record, add a row of the values of the probes of the model to its data, and of each recorded entity to its own data"

	self isStepToRecord ifFalse: [ ^ self ].
	modelData
		addStep: self currentTimeStep
		values: (probes collect: [ :each | cormasModel perform: each ]).
	recordedProbes keysAndValuesDo: [ :aClass :selectors |
			(cormasModel entitiesOfClass: aClass) do: [ :each |
				self recordEntity: each probes: selectors ] ]
]

{ #category : 'data' }
CMSimulation >> recordEntity: anEntity probes: aCollectionOfSelectors [

	| data |
	(excludedEntities isNotEmpty and: [
		 excludedEntities includes: anEntity class -> anEntity id ])
		ifTrue: [ ^ self ].
	data := (entityData
		         at: anEntity class
		         ifAbsentPut: [ Dictionary new ])
		        at: anEntity id
		        ifAbsentPut: [
				        (CMDataTable withColumns: aCollectionOfSelectors)
					        label: anEntity printString;
					        yourself ].
	[
		data
			addStep: self currentTimeStep
			values:
			(aCollectionOfSelectors collect: [ :each | anEntity perform: each ]) ]
		on: CMRecordingError
		do: [ :error |
				CMRecordingError signal:
					anEntity printString , ': ' , error messageText ]
]

{ #category : 'recording' }
CMSimulation >> recordEvery: anInteger [
	"Record the data at init, every anInteger steps, and at the last step"

	recordingInterval := anInteger
]

{ #category : 'recording' }
CMSimulation >> recordedProbesOf: aClass [

	(aClass withAllSuperclasses includesAny: excludedClasses) ifTrue: [
		^ #(  ) ].
	^ aClass probeSelectors reject: [ :selector |
			  excludedProbes anySatisfy: [ :each |
				  each value = selector and: [ aClass includesBehavior: each key ] ] ]
]

{ #category : 'simulation runner - running' }
CMSimulation >> resume [

	simulationRunner resume
]

{ #category : 'simulation runner - running' }
CMSimulation >> runAllSteps [

	simulationRunner
		beDefaultSimulation;
		runInBackground 
]

{ #category : 'simulation runner - running' }
CMSimulation >> runAllStepsAfterEachIntervalDo: aBlock [

	simulationRunner
		beSimulationAfterEachIntervalDo: aBlock;
		runInBackground
]

{ #category : 'simulation runner - running' }
CMSimulation >> runStep [

	self incrementCurrentTimeStep.

	cormasModel perform: activeControlSelector.
	cormasModel removeDestroyedEntities.

	self recordData.

	context timeStepAnnouncer announce:
		(CMTimeStepEnded timeStep: self currentTimeStep)
]

{ #category : 'initialization' }
CMSimulation >> setInitialParameters [

	self setInitialParametersFor: initialParameterValues keys
]

{ #category : 'initialization' }
CMSimulation >> setInitialParametersFor: aCollectionOfParameters [

	| classes parametersWithoutParent otherParameters |
	
	aCollectionOfParameters ifEmpty: [ ^ self ].
	
	classes := aCollectionOfParameters collect: #receiver.
	
	"Parameters that do not have a parent in the list of parameters. Roots of the tree"
	parametersWithoutParent := aCollectionOfParameters reject: [ :parameter |
		classes includes: parameter receiver superclass ].
	
	otherParameters := aCollectionOfParameters reject: [ :parameter |
		parametersWithoutParent includes: parameter ].
	
	parametersWithoutParent do: [ :parameter |
		parameter value: (initialParameterValues at: parameter) ].
	
	self setInitialParametersFor: otherParameters 
]

{ #category : 'testing' }
CMSimulation >> shouldReleaseRandomSeedAfterInitialization [

	^ shouldReleaseRandomSeedAfterInitialization
]

{ #category : 'testing' }
CMSimulation >> shouldReleaseRandomSeedAfterInitialization: aBoolean [

	shouldReleaseRandomSeedAfterInitialization := aBoolean
]

{ #category : 'as yet unclassified' }
CMSimulation >> simulationContext [

	^ context
]

{ #category : 'simulation runner - config' }
CMSimulation >> stepsPerInterval: aPositiveInteger [

	simulationRunner stepsPerInterval: aPositiveInteger
]

{ #category : 'simulation runner - running' }
CMSimulation >> stop [
	"End the simulation at once, also while it is paused, when nobody needs it any more, such as when its window closes. A stopped simulation cannot be resumed"

	simulationRunner stop
]

{ #category : 'simulation runner - config' }
CMSimulation >> stopAfterStep: aNumber [
	"A syntactic sugar to provide a stop condition that will stop a simulation after a given number of steps"
	self stopWhen: [ :model | model currentTimeStep >= aNumber ]
]

{ #category : 'simulation runner - config' }
CMSimulation >> stopWhen: aBlock [
	"Provede a one-argument block with a stop condition. The argument is a cormasModel. Be careful when modifying the stop condition because it can make the simulation run endlesly.
	
	Example: self stopWhen: [ :model | model totalBiomass > 100 ]"
	simulationRunner stopCondition: aBlock
]

{ #category : 'enumerating' }
CMSimulation >> whenFinishedDo: aBlock [

	simulationRunner whenFinishedDo: aBlock
]

{ #category : 'recording' }
CMSimulation >> writeCsvOfClass: aClass on: aStream [
	"Write the data recorded on the instances of aClass, not of its subclasses, as CSV on aStream: a header with step, id, label and the probes of aClass, then a line for each instance and each step it was recorded"

	| tables |
	(recordedProbes includesKey: aClass) ifFalse: [
		CMRecordingError signal: aClass name , ' is not recorded' ].
	aStream
		nextPutAll: (',' join: #( 'step' 'id' 'label' )
					 ,
						 ((recordedProbes at: aClass) collect: [ :each | each asString ]));
		lf.
	tables := entityData at: aClass ifAbsent: [ ^ self ].
	tables keys sorted do: [ :id |
			| table |
			table := tables at: id.
			table rows do: [ :row |
					CMDataTable
						writeCsvValues: {
								row first.
								id.
								table label } , row allButFirst
						on: aStream ] ]
]
