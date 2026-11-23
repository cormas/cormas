Class {
	#name : 'CMAreaSeriesRoassalTest',
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
CMAreaSeriesRoassalTest >> setUp [

	super setUp.
	simulation := (CMSimulation for: CMMockModel new)
		              randomSeed: 41;
		              activeInitSelector: #initFixed;
		              activeControlSelector: #step;
		              initializeSimulation;
		              yourself.
	3 timesRepeat: [ simulation runStep ].
	model := simulation cormasModel.
	chart := CMChart new
]

{ #category : 'tests' }
CMAreaSeriesRoassalTest >> testAChosenColorIsUsedForTheAreaOfItsCategory [
	| series |
	chart add: (CMAreaSeries new x: #currentTimeStep y: #state ofAll: CMMockCell;
			 category: #dead color: Color gray;
			 yourself).
	series := chart seriesDataOf: model in: simulation.
	self assert: series first color equals: Color gray.
	self deny: series second color equals: Color gray
]

{ #category : 'tests' }
CMAreaSeriesRoassalTest >> testAChosenLabelNamesTheAreaOfItsCategory [
	| series |
	chart add: (CMAreaSeries new x: #currentTimeStep y: #state ofAll: CMMockCell;
			 category: #alive label: 'Alive cells';
			 yourself).
	series := chart seriesDataOf: model in: simulation.
	self
		assert: (series collect: [ :each | each name ]) asArray
		equals: #( 'Alive cells' 'dead' )
]

{ #category : 'tests' }
CMAreaSeriesRoassalTest >> testAnAreaOfOneObjectShowsOnlyNumbers [

	| cell |
	cell := (model entitiesOfClass: CMMockCell) first.
	chart areaX: #currentTimeStep y: #state.
	self
		should: [ chart seriesDataOf: cell in: simulation ]
		raise: Error
		withExceptionDo: [ :error |
			self assert: (error messageText includesSubstring: 'state') ]
]

{ #category : 'tests' }
CMAreaSeriesRoassalTest >> testEachAreaIsStackedOnTheAreasBeforeIt [

	| plots |
	chart
		areaX: #currentTimeStep y: #numberOfAliveCells;
		areaX: #currentTimeStep y: #numberOfDeadCells.
	plots := chart plotsOf: (chart seriesDataOf: model in: simulation).
	self assert: plots first value yValues asArray equals: #( 11 5 11 5 ).
	self
		assert: plots second value yValues asArray
		equals: #( 16 16 16 16 )
]

{ #category : 'tests' }
CMAreaSeriesRoassalTest >> testTheAreasOfAProbeOfNumbersAreAnAreaForEachInstance [

	chart areasX: #currentTimeStep y: #energy ofAll: CMMockAnimal.
	self assert: (chart seriesDataOf: model in: simulation) size equals: 2
]

{ #category : 'tests' }
CMAreaSeriesRoassalTest >> testTheAreasOfAProbeOfStringsCountTheInstancesHavingEachValue [

	| series plots |
	chart areasX: #currentTimeStep y: #state ofAll: CMMockCell.
	series := chart seriesDataOf: model in: simulation.
	self
		assert: (series collect: [ :each | each name ]) asArray
		equals: #( 'alive' 'dead' ).
	plots := chart plotsOf: series.
	self
		assert: plots first value yValues asArray
		equals: (simulation modelData column: #numberOfAliveCells) asArray.
	self
		assert: plots second value yValues asArray
		equals: #( 16 16 16 16 )
]

{ #category : 'tests' }
CMAreaSeriesRoassalTest >> testTheChosenCategoriesComeFirstInTheOrderTheyWereChosen [

	| series |
	chart add: (CMAreaSeries new
			 x: #currentTimeStep y: #state ofAll: CMMockCell;
			 category: #dead label: 'Dead' color: Color gray;
			 yourself).
	series := chart seriesDataOf: model in: simulation.
	self
		assert: (series collect: [ :each | each name ]) asArray
		equals: #( 'Dead' 'alive' ).
	self
		assert: (chart plotsOf: series) first value yValues asArray
		equals: (simulation modelData column: #numberOfDeadCells) asArray
]
