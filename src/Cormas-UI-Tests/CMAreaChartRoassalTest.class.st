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
		equals: #( 'state: alive' 'state: dead' ).
	self
		assert: series first values asArray
		equals: (simulation modelData column: #numberOfAliveCells) asArray.
	self
		assert: series second values asArray
		equals: (simulation modelData column: #numberOfDeadCells) asArray
]
