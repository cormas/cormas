Class {
	#name : 'CMEntityDataPresenterTest',
	#superclass : 'TestCase',
	#instVars : [
		'presenter'
	],
	#category : 'Cormas-UI-Tests',
	#package : 'Cormas-UI-Tests'
}

{ #category : 'private' }
CMEntityDataPresenterTest >> cow [

	^ (presenter simulation cormasModel entitiesOfClass: CMMockCow) first
]

{ #category : 'running' }
CMEntityDataPresenterTest >> setUp [

	| simulation application |
	super setUp.
	simulation := (CMSimulation for: CMMockModel new)
		              randomSeed: 41;
		              activeInitSelector: #initFixed;
		              activeControlSelector: #step;
		              initializeSimulation;
		              yourself.
	3 timesRepeat: [ simulation runStep ].
	application := CMSimulationApplication new.
	application simulation: simulation.
	application cormasModel: simulation cormasModel.
	presenter := application newPresenter: CMEntityDataPresenter
]

{ #category : 'tests' }
CMEntityDataPresenterTest >> testAnEntityThatWasNotRecordedHasNoStatistics [

	presenter simulation
		doNotRecord: CMMockCow;
		initializeSimulation.
	presenter entity: self cow.
	self assert: presenter summary table items isEmpty
]

{ #category : 'tests' }
CMEntityDataPresenterTest >> testAnEntityThatWasNotRecordedSaysSo [

	| cow |
	presenter simulation
		doNotRecord: CMMockCow;
		initializeSimulation.
	cow := self cow.
	presenter entity: cow.
	self assert: presenter table items isEmpty.
	self assert: (presenter message includesSubstring: cow printString)
]

{ #category : 'tests' }
CMEntityDataPresenterTest >> testTheDataIsShownAgainAfterMoreSteps [

	presenter entity: self cow.
	presenter simulation runStep.
	presenter showData.
	self assert: presenter table items size equals: 5
]

{ #category : 'tests' }
CMEntityDataPresenterTest >> testTheDataOfAnEntityHasAColumnForTheStepAndForEachProbe [

	presenter entity: self cow.
	self
		assert:
		(presenter table columns collect: [ :each | each title ]) asArray
		equals: #( 'step' 'energy' )
]

{ #category : 'tests' }
CMEntityDataPresenterTest >> testTheDataOfAnEntityHasARowForEachRecordedStep [

	presenter entity: self cow.
	self
		assert:
		(presenter table items collect: [ :each | each first ]) asArray
		equals: #( 0 1 2 3 ).
	self assert: presenter message isEmpty
]

{ #category : 'tests' }
CMEntityDataPresenterTest >> testTheStatisticsOfAnEntityHaveAColumnForEachProbeOfNumbers [

	presenter entity: self cow.
	self
		assert:
			(presenter summary table columns collect: [ :each | each title ])
				asArray
		equals: #( 'statistic' 'energy' )
]
