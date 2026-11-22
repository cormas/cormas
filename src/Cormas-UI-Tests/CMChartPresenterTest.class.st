Class {
	#name : 'CMChartPresenterTest',
	#superclass : 'TestCase',
	#instVars : [
		'presenter'
	],
	#category : 'Cormas-UI-Tests',
	#package : 'Cormas-UI-Tests'
}

{ #category : 'private' }
CMChartPresenterTest >> cow [

	^ (presenter simulation cormasModel entitiesOfClass: CMMockCow) first
]

{ #category : 'running' }
CMChartPresenterTest >> setUp [

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
	presenter := application newPresenter: CMChartPresenter
]

{ #category : 'tests' }
CMChartPresenterTest >> testAChartIsListedByItsTitle [

	self
		assert: (presenter chartList display value: #chartCells)
		equals: 'Cells'
]

{ #category : 'tests' }
CMChartPresenterTest >> testAChartOfDataThatWasNotRecordedSaysWhatIsMissing [

	presenter simulation
		doNotRecord: #numberOfDeadCells of: CMMockModel;
		initializeSimulation.
	presenter drawChart.
	self assert:
		(presenter message includesSubstring: 'numberOfDeadCells')
]

{ #category : 'tests' }
CMChartPresenterTest >> testTheChartOfAnEntityIsDrawnFromItsData [

	presenter subject: self cow.
	self assert: (self textsOfChart includes: 'Energy').
	self assert: (self textsOfChart includes: 'energy').
	self assert: presenter message isEmpty
]

{ #category : 'tests' }
CMChartPresenterTest >> testTheChartOfAnEntityThatWasNotRecordedSaysSo [

	| cow |
	presenter simulation
		doNotRecord: CMMockCow;
		initializeSimulation.
	cow := self cow.
	presenter subject: cow.
	self assert: (presenter message includesSubstring: cow printString)
]

{ #category : 'tests' }
CMChartPresenterTest >> testTheChartsOfAnEntityCanBeChosen [

	presenter subject: self cow.
	self
		assert: presenter chartList items asArray
		equals: #( #chartEnergy )
]

{ #category : 'tests' }
CMChartPresenterTest >> testTheChartsOfTheModelCanBeChosen [

	self
		assert: presenter chartList items asArray
		equals: #( #chartCells )
]

{ #category : 'tests' }
CMChartPresenterTest >> testTheFirstChartIsDrawnFromTheRecordedData [

	| texts |
	texts := (presenter chartView canvas allChildren select: [ :each |
		          each isKindOf: RSLabel ]) collect: [ :each | each text ].
	self assert: (texts includes: 'numberOfAliveCells').
	self assert: (texts includes: 'Cells').
	self assert: presenter message isEmpty
]

{ #category : 'private' }
CMChartPresenterTest >> textsOfChart [

	^ (presenter chartView canvas allChildren select: [ :each |
		   each isKindOf: RSLabel ]) collect: [ :each | each text ]
]
