Class {
	#name : 'CMAreaChartRoassalTest',
	#superclass : 'TestCase',
	#instVars : [
		'simulation',
		'model',
		'chart'
	],
	#category : 'Cormas-UI-Tests',
	#package : 'Cormas-UI-Tests'
}

{ #category : 'running' }
CMAreaChartRoassalTest >> setUp [

	super setUp.
	simulation := (CMSimulation for: CMMockModel new)
		              randomSeed: 41;
		              activeInitSelector: #initFixed;
		              activeControlSelector: #step;
		              initializeSimulation;
		              yourself.
	3 timesRepeat: [ simulation runStep ].
	model := simulation cormasModel.
	chart := CMAreaChart new
]

{ #category : 'tests' }
CMAreaChartRoassalTest >> testAChosenColorIsUsedForTheAreaOfItsCategory [
	| series |
	chart add: (CMAreaSeries new probe: #state ofAll: CMMockCell;
			 category: #dead color: Color gray;
			 yourself).
	series := chart seriesDataOf: model in: simulation.
	self assert: series first color equals: Color gray.
	self deny: series second color equals: Color gray
]

{ #category : 'tests' }
CMAreaChartRoassalTest >> testAChosenLabelNamesTheAreaOfItsCategory [
	| series |
	chart add: (CMAreaSeries new probe: #state ofAll: CMMockCell;
			 category: #alive label: 'Alive cells';
			 yourself).
	series := chart seriesDataOf: model in: simulation.
	self
		assert: (series collect: [ :each | each name ]) asArray
		equals: #( 'Alive cells' 'dead' )
]

{ #category : 'tests' }
CMAreaChartRoassalTest >> testAnAreaOfOneObjectShowsOnlyNumbers [

	| cell |
	cell := (model entitiesOfClass: CMMockCell) first.
	chart area: #state.
	self
		should: [ chart seriesDataOf: cell in: simulation ]
		raise: Error
		withExceptionDo: [ :error |
			self assert: (error messageText includesSubstring: 'state') ]
]

{ #category : 'tests' }
CMAreaChartRoassalTest >> testEachAreaIsStackedOnTheAreasBeforeIt [

	| plots |
	chart
		area: #numberOfAliveCells;
		area: #numberOfDeadCells.
	plots := chart plotsOf: (chart seriesDataOf: model in: simulation).
	self assert: plots first value yValues asArray equals: #( 11 5 11 5 ).
	self
		assert: plots second value yValues asArray
		equals: #( 16 16 16 16 )
]

{ #category : 'tests' }
CMAreaChartRoassalTest >> testTheAreasOfAProbeOfNumbersAreAnAreaForEachInstance [

	chart areas: #energy ofAll: CMMockAnimal.
	self assert: (chart seriesDataOf: model in: simulation) size equals: 2
]

{ #category : 'tests' }
CMAreaChartRoassalTest >> testTheAreasOfAProbeOfStringsCountTheInstancesHavingEachValue [
	| series |
	chart areas: #state ofAll: CMMockCell.
	series := chart seriesDataOf: model in: simulation.
	self
		assert: (series collect: [ :each | each name ]) asArray
		equals: #( 'alive' 'dead' ).
	self
		assert: series first values asArray
		equals: (simulation modelData column: #numberOfAliveCells) asArray.
	self
		assert: series second values asArray
		equals: (simulation modelData column: #numberOfDeadCells) asArray
]

{ #category : 'tests' }
CMAreaChartRoassalTest >> testTheChosenCategoriesComeFirstInTheOrderTheyWereChosen [
	| series |
	chart add: (CMAreaSeries new probe: #state ofAll: CMMockCell;
			 category: #dead label: 'Dead' color: Color gray;
			 yourself).
	series := chart seriesDataOf: model in: simulation.
	self
		assert: (series collect: [ :each | each name ]) asArray
		equals: #( 'Dead' 'alive' ).
	self
		assert: series first values asArray
		equals: (simulation modelData column: #numberOfDeadCells) asArray
]
