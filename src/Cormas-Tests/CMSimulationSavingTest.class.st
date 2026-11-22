"
I check that saving a simulation writes its run folder: the run's settings and versions as JSON, and the data of the model and of each class as CSV.
"
Class {
	#name : 'CMSimulationSavingTest',
	#superclass : 'TestCase',
	#instVars : [
		'simulation',
		'model',
		'output'
	],
	#category : 'Cormas-Tests',
	#package : 'Cormas-Tests'
}

{ #category : 'helpers' }
CMSimulationSavingTest >> savedSettings [
	"Run the simulation for two steps, save it, and return its settings read back from the JSON"

	| run |
	simulation runStep.
	simulation runStep.
	run := simulation saveDataIn: output.
	^ STONJSON fromString: (run / 'run.json') contents
]

{ #category : 'running' }
CMSimulationSavingTest >> setUp [

	super setUp.
	simulation := (CMSimulation for: CMMockModel new)
		              randomSeed: 41;
		              activeInitSelector: #initFixed;
		              activeControlSelector: #step;
		              stopAfterStep: 2;
		              yourself.
	model := simulation cormasModel.
	output := FileSystem memory / 'output'
]

{ #category : 'running' }
CMSimulationSavingTest >> tearDown [

	CMMockCow resetParameters.
	super tearDown
]

{ #category : 'tests' }
CMSimulationSavingTest >> testAFractionParameterIsSavedAsAFloat [

	CMMockCow initialEnergy: 1 / 4.
	simulation initializeSimulation.
	self
		assert:
			(((self savedSettings at: 'parameters') at: 'CMMockCow') at:
				 'initialEnergy')
		equals: 0.25
]

{ #category : 'tests' }
CMSimulationSavingTest >> testAModelOutsideTheWorkspaceIsSavedWithoutCommit [

	| versions |
	simulation initializeSimulation.
	versions := self savedSettings at: 'versions'.
	self
		assert: (versions at: 'cormas')
		equals: CMVersion current printString.
	self assert: (versions includesKey: 'commit').
	self assert: (versions at: 'commit') isNil
]

{ #category : 'tests' }
CMSimulationSavingTest >> testARunIsSavedInAFolderNamedAfterItsStartAndInit [

	| run |
	simulation initializeSimulation.
	run := simulation saveDataIn: output.
	self assert: run parent equals: output.
	self assert: ('####-##-##T##-##-## initFixed' match: run basename)
]

{ #category : 'tests' }
CMSimulationSavingTest >> testTheDataOfTheModelAndOfEachRecordedClassIsSavedAsCsv [

	| run |
	simulation initializeSimulation.
	simulation runStep.
	run := simulation saveDataIn: output.
	self
		assert: (run children collect: [ :each | each basename ] as: Set)
		equals:
			#( 'run.json' 'data.csv' 'data-CMMockCow.csv' 'data-CMMockGoat.csv'
			   'data-CMMockCell.csv' ) asSet.
	self
		assert: (run / 'data.csv') contents
		equals: (String streamContents: [ :stream |
				 simulation modelData writeCsvOn: stream ]).
	self
		assert: (run / 'data-CMMockCow.csv') contents
		equals: (String streamContents: [ :stream |
				 simulation writeCsvOfClass: CMMockCow on: stream ])
]

{ #category : 'tests' }
CMSimulationSavingTest >> testTheDefaultStopConditionIsSavedWithItsFinalStep [

	| run |
	simulation := (CMSimulation for: CMMockModel new)
		              activeInitSelector: #initFixed;
		              activeControlSelector: #step;
		              yourself.
	simulation initializeSimulation.
	run := simulation saveDataIn: output.
	self
		assert: ((STONJSON fromString: (run / 'run.json') contents) at:
				 'stopCondition')
		equals: '[ :model | model currentTimeStep >= '
			, CMSimulation defaultFinalTimeStep printString , ' ]'
]

{ #category : 'tests' }
CMSimulationSavingTest >> testTheParametersOfARunAreTheirValuesAtInit [

	| parameters |
	model weather: #rainy.
	CMMockCow initialEnergy: 7.
	simulation initializeSimulation.
	model weather: #sunny.
	CMMockCow initialEnergy: 8.
	parameters := self savedSettings at: 'parameters'.
	self
		assert: ((parameters at: 'CMMockModel') at: 'weather')
		equals: 'rainy'.
	self
		assert: ((parameters at: 'CMMockModel') at: 'numberOfRows')
		equals: 4.
	self
		assert: ((parameters at: 'CMMockCow') at: 'initialEnergy')
		equals: 7
]

{ #category : 'tests' }
CMSimulationSavingTest >> testTheSeedOfARunIsTheOneItWasInitializedWith [

	simulation shouldReleaseRandomSeedAfterInitialization: true.
	simulation initializeSimulation.
	self deny: simulation simulationContext randomSeed equals: 41.
	self assert: (self savedSettings at: 'seed') equals: 41
]

{ #category : 'tests' }
CMSimulationSavingTest >> testTheSettingsOfARunAreSaved [

	| settings |
	simulation initializeSimulation.
	settings := self savedSettings.
	self assert: (settings at: 'model') equals: 'CMMockModel'.
	self assert: (settings at: 'init') equals: 'initFixed'.
	self assert: (settings at: 'control') equals: 'step'.
	self assert: (settings at: 'seed') equals: 41.
	self assert: (settings at: 'lastStep') equals: 2.
	self
		assert: (settings at: 'stopCondition')
		equals: '[ :model | model currentTimeStep >= 2 ]'
]

{ #category : 'tests' }
CMSimulationSavingTest >> testWhatIsNotRecordedIsSaved [

	| recording |
	simulation
		recordEvery: 3;
		doNotRecord: CMMockGoat;
		doNotRecord: #numberOfDeadCells of: CMMockModel.
	simulation initializeSimulation.
	simulation doNotRecordEntity:
		(model entitiesOfClass: CMMockCow) first.
	simulation initializeSimulation.
	recording := self savedSettings at: 'recording'.
	self assert: (recording at: 'interval') equals: 3.
	self
		assert: (recording at: 'notRecordedClasses')
		equals: #( 'CMMockGoat' ).
	self
		assert: (recording at: 'notRecordedProbes')
		equals: (Dictionary with: 'CMMockModel' -> #( 'numberOfDeadCells' )).
	self
		assert: (recording at: 'notRecordedEntities')
		equals: (Dictionary with: 'CMMockCow' -> #( 1 ))
]
