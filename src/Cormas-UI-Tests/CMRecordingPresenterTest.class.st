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
CMRecordingPresenterTest >> testAClassCanBeRecordedAgain [

	presenter doNotRecord: CMMockCow.
	presenter record: CMMockCow.
	self assert: (presenter isRecorded: CMMockCow).
	self initializeWithSettings.
	self assert: (simulation dataOf: self cow) size equals: 1
]

{ #category : 'tests' }
CMRecordingPresenterTest >> testAClassThatIsNotRecordedIsSwitchedOffInTheSimulation [

	presenter doNotRecord: CMMockCow.
	self deny: (presenter isRecorded: CMMockCow).
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
CMRecordingPresenterTest >> testEachClassListsItsProbes [

	self
		assert: (presenter classesTree children value: CMMockModel) asArray
		equals: {
				(CMMockModel -> #numberOfAliveCells).
				(CMMockModel -> #numberOfDeadCells) }
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
CMRecordingPresenterTest >> testTheModelComesFirstThenTheClassesWithProbes [

	self assert: presenter classesTree roots asArray equals: {
			CMMockModel.
			CMMockAnimal.
			CMMockCell.
			CMMockCow.
			CMMockGoat }
]

{ #category : 'tests' }
CMRecordingPresenterTest >> testTheRecordingIntervalIsApplied [

	presenter intervalInput number: 3.
	self initializeWithSettings.
	6 timesRepeat: [ simulation runStep ].
	self assert: simulation modelData steps asArray equals: #( 0 3 6 )
]
