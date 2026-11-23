Class {
	#name : 'CMBarSeriesRoassalTest',
	#superclass : 'CMStackedSeriesRoassalTest',
	#category : 'Cormas-UI-Tests',
	#package : 'Cormas-UI-Tests'
}

{ #category : 'tests' }
CMBarSeriesRoassalTest >> testABarIsDrawnAtEachValueOnX [

	| canvas |
	chart barsX: #currentTimeStep y: #numberOfAliveCells.
	canvas := chart
		          canvasOf: (chart seriesDataOf: model in: simulation)
		          hiding: Set new.
	self
		assert: (canvas allChildren count: [ :each | each model = #bar ])
		equals: 4
]

{ #category : 'tests' }
CMBarSeriesRoassalTest >> testEachBarIsStackedOnTheBarsBeforeIt [

	| plots |
	chart
		barsX: #currentTimeStep y: #numberOfAliveCells;
		barsX: #currentTimeStep y: #numberOfDeadCells.
	plots := chart plotsOf: (chart seriesDataOf: model in: simulation).
	self
		assert: plots first value definedValuesY asArray
		equals: #( 11 5 11 5 0 0 0 0 ).
	self
		assert: plots second value definedValuesY asArray
		equals: #( 16 16 16 16 11 5 11 5 )
]

{ #category : 'tests' }
CMBarSeriesRoassalTest >> testNegativeBarsAreStackedBelowZero [

	| plots |
	plots := chart plotsOf: (self flowsDrawnBy: CMBarSeries).
	self
		assert:
		(plots collect: [ :each | each value definedValuesY asArray ]) asArray
		equals: #( #( 3 2 0 0 ) #( 0 0 -1 -4 ) #( -1 -4 -3 -5 ) )
]

{ #category : 'tests' }
CMBarSeriesRoassalTest >> testTheBarsOfAProbeOfStringsCountTheInstancesHavingEachValue [

	| series plots |
	chart barsX: #currentTimeStep y: #state ofAll: CMMockCell.
	series := chart seriesDataOf: model in: simulation.
	self
		assert: (series collect: [ :each | each name ]) asArray
		equals: #( 'alive' 'dead' ).
	plots := chart plotsOf: series.
	self
		assert: (plots second value definedValuesY first: 4) asArray
		equals: #( 16 16 16 16 )
]

{ #category : 'tests' }
CMBarSeriesRoassalTest >> testTheYAxisReachesTheLowestNegativeBar [

	| roassalChart |
	roassalChart := chart
		                roassalChartOf:
		                (chart plotsOf: (self flowsDrawnBy: CMBarSeries))
		                xCategories: #(  )
		                leavingRoomToGrow: false.
	self assert: roassalChart minChartValueY <= -5.
	self assert: roassalChart maxChartValueY >= 3
]
