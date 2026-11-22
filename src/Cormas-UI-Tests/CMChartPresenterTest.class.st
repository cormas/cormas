Class {
	#name : 'CMChartPresenterTest',
	#superclass : 'TestCase',
	#instVars : [
		'presenter'
	],
	#category : 'Cormas-UI-Tests',
	#package : 'Cormas-UI-Tests'
}

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

	presenter chartList selectItem: #chartOfAMethodThatIsNotAProbe.
	self assert: (presenter message includesSubstring: 'numberOfCows')
]

{ #category : 'tests' }
CMChartPresenterTest >> testTheChartsOfTheModelCanBeChosen [

	self
		assert: presenter chartList items asArray
		equals: #( #chartCells #chartOfAMethodThatIsNotAProbe )
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
