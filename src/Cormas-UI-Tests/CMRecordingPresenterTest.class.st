Class {
	#name : 'CMRecordingPresenterTest',
	#superclass : 'TestCase',
	#instVars : [
		'presenter',
		'simulation'
	],
	#category : 'Cormas-UI-Tests',
	#package : 'Cormas-UI-Tests'
}

{ #category : 'running' }
CMRecordingPresenterTest >> cow [

	^ (simulation cormasModel entitiesOfClass: CMMockCow) first
]

{ #category : 'running' }
CMRecordingPresenterTest >> initializeWithSettings [

	presenter applyTo: simulation.
	simulation initializeSimulation
]

{ #category : 'running' }
CMRecordingPresenterTest >> setUp [

	| application |
	super setUp.
	application := CMSimulationApplication new.
	application cormasModel: CMMockModel new.
	presenter := application newPresenter: CMRecordingPresenter.
	simulation := (CMSimulation for: application cormasModel)
		              randomSeed: 41;
		              activeInitSelector: #initFixed;
		              activeControlSelector: #step;
		              yourself
]

{ #category : 'tests' }
CMRecordingPresenterTest >> testAClassWithoutAnyProbeToRecordIsNotRecorded [

	presenter doNotRecord: #energy of: CMMockAnimal.
	self initializeWithSettings.
	self should: [ simulation dataOf: self cow ] raise: CMRecordingError
]

{ #category : 'tests' }
CMRecordingPresenterTest >> testAProbeCanBeRecordedAgain [

	presenter doNotRecord: #numberOfDeadCells of: CMMockModel.
	presenter record: #numberOfDeadCells of: CMMockModel.
	self assert:
		(presenter isRecorded: #numberOfDeadCells of: CMMockModel).
	self initializeWithSettings.
	self assert: simulation probes size equals: 2
]

{ #category : 'tests' }
CMRecordingPresenterTest >> testAProbeThatIsNotRecordedIsSwitchedOffInTheSimulation [

	presenter doNotRecord: #numberOfDeadCells of: CMMockModel.
	self deny: (presenter isRecorded: #numberOfDeadCells of: CMMockModel).
	self initializeWithSettings.
	self
		assert: simulation probes asArray
		equals: #( #numberOfAliveCells )
]

{ #category : 'tests' }
CMRecordingPresenterTest >> testEachProbeHasARowTheModelFirstThenTheClassesByName [

	self assert: presenter probesTable items asArray equals: {
			(CMMockModel -> #numberOfAliveCells).
			(CMMockModel -> #numberOfDeadCells).
			(CMMockAnimal -> #energy).
			(CMMockCell -> #state) }
]

{ #category : 'tests' }
CMRecordingPresenterTest >> testEverythingIsRecordedByDefault [

	self initializeWithSettings.
	self assert: simulation probes size equals: 2.
	self
		assert: (simulation dataOf: self cow) columnNames asArray
		equals: #( #energy )
]

{ #category : 'tests' }
CMRecordingPresenterTest >> testTheRecordingIntervalIsApplied [

	presenter intervalInput number: 3.
	self initializeWithSettings.
	6 timesRepeat: [ simulation runStep ].
	self assert: simulation modelData steps asArray equals: #( 0 3 6 )
]

{ #category : 'tests' }
CMRecordingPresenterTest >> testTheTableHasAColumnToRecordAndColumnsForTheClassAndTheProbe [

	self
		assert:
			(presenter probesTable columns collect: [ :each | each title ])
				asArray
		equals: #( 'Record' 'Class' 'Probe' )
]
