Class {
	#name : 'CMSensitivityAnalysisTest',
	#superclass : 'TestCase',
	#instVars : [
		'analysis',
		'simulation',
		'output'
	],
	#category : 'Cormas-Tests',
	#package : 'Cormas-Tests'
}

{ #category : 'private' }
CMSensitivityAnalysisTest >> csvOf: aFile [
	"Return the lines of the CSV aFile, each as an Array of its fields"

	^ aFile contents lines collect: [ :each | (each splitOn: $,) asArray ]
]

{ #category : 'running' }
CMSensitivityAnalysisTest >> setUp [

	super setUp.
	simulation := (CMSimulation for: CMMockModel new)
		              activeInitSelector: #init;
		              activeControlSelector: #step;
		              stopAfterStep: 2;
		              yourself.
	analysis := (CMSensitivityAnalysis on: simulation)
		            masterSeed: 42;
		            yourself.
	output := FileSystem memory / 'output'
]

{ #category : 'running' }
CMSensitivityAnalysisTest >> tearDown [

	CMMockCow resetParameters.
	super tearDown
]

{ #category : 'tests' }
CMSensitivityAnalysisTest >> testAFullFactorialRunsEachCombinationOfValuesForEachReplicate [

	| results |
	analysis
		parameter: #initialNumberOfCows of: CMMockModel values: #( 1 2 );
		parameter: #initialEnergy of: CMMockCow values: #( 0.5 1 );
		replicates: 2.
	results := self csvOf: (analysis runIn: output) / 'results.csv'.
	self
		assert: (results first first: 5)
		equals: #( 'run' 'replicate' 'seed' 'initialNumberOfCows'
			   'CMMockCow.initialEnergy' ).
	self
		assert: (results allButFirst collect: [ :each |
				 (each at: 4) , ' ' , (each at: 5) ]) asArray
		equals: #( '1 0.5' '1 0.5' '1 1' '1 1' '2 0.5' '2 0.5' '2 1' '2 1' )
]

{ #category : 'tests - views' }
CMSensitivityAnalysisTest >> testAFullFactorialShowsAParameterWithAllTheRuns [

	analysis
		parameter: #initialNumberOfCows of: CMMockModel values: #( 1 2 );
		parameter: #initialNumberOfGoats of: CMMockModel values: #( 4 ).
	analysis runIn: output.
	self
		assert:
			((analysis resultsVarying: 'initialNumberOfGoats') collect: [ :row |
				 row at: 'run' ]) asArray
		equals: #( 1 2 )
]

{ #category : 'tests' }
CMSensitivityAnalysisTest >> testAParameterTheModelDoesNotHaveIsRefused [

	self
		should: [ analysis parameter: #speed of: CMMockCow values: #( 1 ) ]
		raise: Error
		withExceptionDo: [ :error |
				self
					assert: error messageText
					equals: 'CMMockCow has no parameter speed' ]
]

{ #category : 'tests' }
CMSensitivityAnalysisTest >> testAReplicateHasTheSameSeedInEveryCombination [

	| results seedsPerReplicate |
	analysis
		parameter: #initialNumberOfCows of: CMMockModel values: #( 1 2 );
		replicates: 3.
	results := (self csvOf: (analysis runIn: output) / 'results.csv')
		           allButFirst.
	seedsPerReplicate := (results groupedBy: [ :each | each at: 2 ])
		                     collect: [ :rows |
		                     (rows collect: [ :each | each at: 3 ]) asSet ].
	self assert: seedsPerReplicate size equals: 3.
	self assert:
		(seedsPerReplicate allSatisfy: [ :each | each size = 1 ]).
	self
		assert: (results collect: [ :each | each at: 3 ]) asSet size
		equals: 3
]

{ #category : 'tests' }
CMSensitivityAnalysisTest >> testAnAnalysisInAnotherProcessCanBePausedAndResumed [

	| finished |
	finished := Semaphore new.
	analysis
		parameter: #initialNumberOfCows of: CMMockModel values: #( 1 2 );
		whenProgressDo: [ :each |
			each numberOfCompletedRuns = 1 ifTrue: [ each pause ] ];
		whenFinishedDo: [ :each | finished signal ].
	[ analysis runIn: output ] fork.
	self
		assert: (finished waitTimeoutMilliseconds: 500)
		description: 'A paused analysis must not finish'.
	self assert: analysis numberOfCompletedRuns equals: 1.
	analysis resume.
	self deny: (finished waitTimeoutMilliseconds: 5000).
	self assert: analysis numberOfCompletedRuns equals: 2
]

{ #category : 'tests' }
CMSensitivityAnalysisTest >> testEachRunIsSavedInAFolderOfTheAnalysis [

	| folder results run |
	analysis
		parameter: #initialNumberOfCows of: CMMockModel values: #( 1 2 );
		replicates: 2.
	folder := analysis runIn: output.
	self
		assert:
		(folder children collect: [ :each | each basename ]) sorted asArray
		equals:
			#( 'analysis.json' 'results-CMMockCell.csv'
			   'results-CMMockCow.csv' 'results-CMMockGoat.csv'
			   'results.csv' 'run-1' 'run-2' 'run-3' 'run-4' ).
	results := self csvOf: folder / 'results.csv'.
	run := STONJSON fromString: (folder / 'run-3' / 'run.json') contents.
	self
		assert:
		(((run at: 'parameters') at: 'CMMockModel') at:
			 'initialNumberOfCows')
		equals: 2.
	self
		assert: (run at: 'seed') printString
		equals: ((results at: 4) at: 3)
]

{ #category : 'tests' }
CMSensitivityAnalysisTest >> testEntityResultsHaveTheFinalValuesOfEachInstance [

	| results |
	analysis
		parameter: #initialNumberOfCows
		of: CMMockModel
		values: #( 1 2 ).
	results := self csvOf:
		           (analysis runIn: output) / 'results-CMMockCow.csv'.
	self
		assert: results first
		equals: #( 'run' 'replicate' 'seed' 'initialNumberOfCows'
			   'id' 'label' 'step' 'energy' ).
	self
		assert: (results allButFirst collect: [ :each |
				 (each first: 1) , (each copyFrom: 4 to: 5) , { (each at: 7) } ])
				asArray
		equals:
		#( #( '1' '1' '1' '2' ) #( '2' '2' '1' '2' ) #( '2' '2' '2' '2' ) )
]

{ #category : 'tests' }
CMSensitivityAnalysisTest >> testOneFactorAtATimeKeepsTheOtherParametersAtTheirValuesInTheSimulation [

	| results |
	simulation cormasModel initialNumberOfCows: 5.
	analysis
		parameter: #initialNumberOfCows of: CMMockModel values: #( 1 2 );
		parameter: #initialNumberOfGoats of: CMMockModel values: #( 4 );
		beOneFactorAtATime.
	results := self csvOf: (analysis runIn: output) / 'results.csv'.
	self
		assert: (results allButFirst collect: [ :each |
				 (each at: 4) , ' ' , (each at: 5) ]) asArray
		equals: #( '1 3' '2 3' '5 4' )
]

{ #category : 'tests - views' }
CMSensitivityAnalysisTest >> testOneFactorAtATimeShowsAParameterWithTheRunsVaryingIt [

	analysis
		parameter: #initialNumberOfCows of: CMMockModel values: #( 1 2 );
		parameter: #initialNumberOfGoats of: CMMockModel values: #( 1 2 4 );
		beOneFactorAtATime.
	analysis runIn: output.
	self
		assert:
			((analysis resultsVarying: 'initialNumberOfGoats') collect: [ :row |
				 row at: 'run' ]) asArray
		equals: #( 3 4 5 )
]

{ #category : 'tests - views' }
CMSensitivityAnalysisTest >> testOutputsAreTheRecordedProbesOfTheModel [

	simulation doNotRecord: #numberOfDeadCells of: CMMockModel.
	self
		assert: (CMSensitivityAnalysis on: simulation) outputs asArray
		equals: #( 'numberOfAliveCells' )
]

{ #category : 'tests - views' }
CMSensitivityAnalysisTest >> testResultsGroupedByAParameterAreInTheOrderOfItsValues [

	| groups |
	analysis
		parameter: #initialNumberOfCows of: CMMockModel values: #( 1 2 );
		parameter: #initialNumberOfGoats of: CMMockModel values: #( 5 4 ).
	analysis runIn: output.
	groups := analysis resultsGroupedBy: 'initialNumberOfGoats'.
	self assert: groups keys asArray equals: #( 5 4 ).
	self
		assert:
			((groups at: 4) collect: [ :row | row at: 'initialNumberOfCows' ])
				asArray
		equals: #( 1 2 )
]

{ #category : 'tests' }
CMSensitivityAnalysisTest >> testResultsHaveTheFinalValueOfEachModelProbe [

	| folder results data |
	analysis
		parameter: #initialNumberOfCows of: CMMockModel values: #( 1 2 );
		recordEvery: 1.
	folder := analysis runIn: output.
	results := self csvOf: folder / 'results.csv'.
	data := self csvOf: folder / 'run-2' / 'data.csv'.
	self
		assert: results first
		equals: #( 'run' 'replicate' 'seed' 'initialNumberOfCows'
			   'step' 'numberOfAliveCells' 'numberOfDeadCells' ).
	self assert: (results last allButFirst: 4) equals: data last
]

{ #category : 'tests - views' }
CMSensitivityAnalysisTest >> testResultsOfOneFactorAtATimeCannotBeGrouped [

	analysis
		parameter: #initialNumberOfCows of: CMMockModel values: #( 1 2 );
		parameter: #initialNumberOfGoats of: CMMockModel values: #( 4 );
		beOneFactorAtATime.
	analysis runIn: output.
	self
		should: [ analysis resultsGroupedBy: 'initialNumberOfGoats' ]
		raise: Error
		withExceptionDo: [ :error |
			self assert: (error messageText includesSubstring: 'factorial') ]
]

{ #category : 'tests' }
CMSensitivityAnalysisTest >> testRunFoldersAreNumberedSoThatTheyAreSortedInOrder [

	| folder |
	analysis replicates: 10.
	folder := analysis runIn: output.
	self assert: (folder / 'run-01') exists.
	self assert: (folder / 'run-10') exists
]

{ #category : 'tests' }
CMSensitivityAnalysisTest >> testRunsRecordEveryStepsWhenAsked [

	analysis recordEvery: 1.
	self
		assert:
		((analysis runIn: output) / 'run-1' / 'data.csv') contents lines
			size
		equals: 4
]

{ #category : 'tests' }
CMSensitivityAnalysisTest >> testRunsRecordTheirLastStepOnly [

	| run |
	run := (analysis runIn: output) / 'run-1'.
	self assert: (run / 'data.csv') contents lines size equals: 2.
	self
		assert:
			(((STONJSON fromString: (run / 'run.json') contents) at:
				  'recording') at: 'steps')
		equals: (Dictionary with: 'type' -> 'last')
]

{ #category : 'tests' }
CMSensitivityAnalysisTest >> testRunsTakeTheSettingsOfTheSimulation [

	| folder results |
	simulation
		doNotRecord: CMMockGoat;
		doNotRecord: #numberOfDeadCells of: CMMockModel;
		stopAfterStep: 1.
	folder := analysis runIn: output.
	results := self csvOf: folder / 'results.csv'.
	self
		assert: results first
		equals: #( 'run' 'replicate' 'seed' 'step' 'numberOfAliveCells' ).
	self assert: (results second at: 4) equals: '1'.
	self deny: (folder / 'results-CMMockGoat.csv') exists
]

{ #category : 'tests' }
CMSensitivityAnalysisTest >> testStoppingKeepsTheResultsOfTheRunsDone [

	| folder finished |
	finished := 0.
	analysis
		parameter: #initialNumberOfCows of: CMMockModel values: #( 1 2 3 );
		whenProgressDo: [ :each | each stop ];
		whenFinishedDo: [ :each | finished := finished + 1 ].
	folder := analysis runIn: output.
	self assert: (folder / 'results.csv') contents lines size equals: 2.
	self deny: (folder / 'run-2') exists.
	self assert: finished equals: 1
]

{ #category : 'tests' }
CMSensitivityAnalysisTest >> testTheAnalysisIsDescribedInAnalysisJson [

	| json |
	analysis
		parameter: #initialNumberOfCows of: CMMockModel values: #( 1 2 );
		replicates: 3;
		beOneFactorAtATime.
	json := STONJSON fromString:
		        ((analysis runIn: output) / 'analysis.json') contents.
	self assert: (json at: 'model') equals: 'CMMockModel'.
	self assert: (json at: 'init') equals: 'init'.
	self
		assert: (json at: 'design')
		equals: (Dictionary with: 'type' -> 'oneFactorAtATime').
	self
		assert: (((json at: 'factors') at: 'CMMockModel') at: 'initialNumberOfCows')
		equals: #( 1 2 ).
	self assert: (json at: 'replicates') equals: 3.
	self assert: (json at: 'masterSeed') equals: 42.
	self
		assert: ((json at: 'recording') at: 'steps')
		equals: (Dictionary with: 'type' -> 'last').
	self deny: (json includesKey: 'seed')
]

{ #category : 'tests' }
CMSensitivityAnalysisTest >> testTheNumberOfRunsDependsOnTheDesign [

	analysis
		parameter: #initialNumberOfCows of: CMMockModel values: #( 1 2 );
		parameter: #initialNumberOfGoats of: CMMockModel values: #( 1 2 3 );
		replicates: 2.
	self assert: analysis numberOfRuns equals: 12.
	analysis beOneFactorAtATime.
	self assert: analysis numberOfRuns equals: 10.
	analysis beFullFactorial.
	self assert: analysis numberOfRuns equals: 12
]

{ #category : 'tests' }
CMSensitivityAnalysisTest >> testTheParametersOfTheSimulationAreKeptAfterTheAnalysis [

	| before |
	CMMockCow initialEnergy: 0.7.
	simulation cormasModel initialNumberOfCows: 5.
	before := simulation cormasModel parameterValues.
	analysis
		parameter: #initialNumberOfCows of: CMMockModel values: #( 1 );
		parameter: #initialEnergy of: CMMockCow values: #( 1 );
		runIn: output.
	self assert: simulation cormasModel parameterValues equals: before.
	self assert: CMMockCow initialEnergy equals: 0.7
]

{ #category : 'tests' }
CMSensitivityAnalysisTest >> testTheSameMasterSeedGivesTheSameResults [

	| first second |
	analysis
		parameter: #initialNumberOfCows of: CMMockModel values: #( 1 2 );
		replicates: 2.
	first := analysis runIn: output / 'first'.
	second := (CMSensitivityAnalysis on: simulation)
		          parameter: #initialNumberOfCows
		          of: CMMockModel
		          values: #( 1 2 );
		          replicates: 2;
		          masterSeed: 42;
		          runIn: output / 'second'.
	#( 'results.csv' 'results-CMMockCow.csv' 'results-CMMockGoat.csv' )
		do: [ :each |
			self
				assert: (second / each) contents
				equals: (first / each) contents ]
]

{ #category : 'tests - views' }
CMSensitivityAnalysisTest >> testTheSpreadOfAnOutputHasTheValueOfEachReplicateForEachCombination [

	| spreads |
	analysis
		parameter: #initialNumberOfCows of: CMMockModel values: #( 1 2 );
		replicates: 3.
	analysis runIn: output.
	spreads := analysis spreadsOf: 'numberOfAliveCells'.
	self
		assert: (spreads collect: [ :each | each key ]) asArray
		equals: #( #( 1 ) #( 2 ) ).
	self
		assert: spreads last value asArray
		equals: ((analysis results last: 3) collect: [ :row |
				 row at: 'numberOfAliveCells' ]) asArray
]

{ #category : 'tests - views' }
CMSensitivityAnalysisTest >> testTheSpreadOfOneFactorAtATimeKeepsCombinationsWithTheSameValues [

	| spreads |
	simulation cormasModel
		initialNumberOfCows: 1;
		initialNumberOfGoats: 4.
	analysis
		parameter: #initialNumberOfCows of: CMMockModel values: #( 1 2 );
		parameter: #initialNumberOfGoats of: CMMockModel values: #( 4 );
		beOneFactorAtATime.
	analysis runIn: output.
	spreads := analysis spreadsOf: 'numberOfAliveCells'.
	self
		assert: (spreads collect: [ :each | each key ]) asArray
		equals: #( #( 1 4 ) #( 2 4 ) #( 1 4 ) )
]
