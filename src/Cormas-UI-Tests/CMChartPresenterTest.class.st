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
CMChartPresenterTest >> clickLegendEntryNamed: aString [

	(presenter chartView canvas allChildren detect: [ :each |
			 (each isKindOf: RSComposite) and: [
					 each children anySatisfy: [ :child |
						 (child isKindOf: RSLabel) and: [ child text = aString ] ] ] ])
		announce: RSMouseClick new
]

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
	presenter := application newPresenter: CMChartPresenter.
	presenter subject: simulation cormasModel chart: #chartCells
]

{ #category : 'tests' }
CMChartPresenterTest >> testAChartIsTitledByItsTitle [

	self assert: presenter title equals: 'Cells'
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
CMChartPresenterTest >> testALineHiddenFromTheLegendStaysHiddenWhenTheChartIsDrawnAgain [

	self clickLegendEntryNamed: 'numberOfDeadCells'.
	presenter drawChart.
	self assert: (presenter hiddenLines includes: 'numberOfDeadCells')
]

{ #category : 'tests' }
CMChartPresenterTest >> testTheChartIsDrawnFromTheRecordedData [

	self assert: (self textsOfChart includes: 'numberOfAliveCells').
	self assert: (self textsOfChart includes: 'Cells').
	self assert: presenter message isEmpty
]

{ #category : 'tests' }
CMChartPresenterTest >> testTheChartOfAnEntityIsDrawnFromItsData [

	presenter subject: self cow chart: #chartEnergy.
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
	presenter subject: cow chart: #chartEnergy.
	self assert: (presenter message includesSubstring: cow printString)
]

{ #category : 'private' }
CMChartPresenterTest >> textsOfChart [

	^ (presenter chartView canvas allChildren select: [ :each |
		   each isKindOf: RSLabel ]) collect: [ :each | each text ]
]
