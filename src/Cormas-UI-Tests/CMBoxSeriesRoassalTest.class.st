Class {
	#name : 'CMBoxSeriesRoassalTest',
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
CMBoxSeriesRoassalTest >> setUp [

	super setUp.
	simulation := (CMSimulation for: CMMockModel new)
		              randomSeed: 41;
		              activeInitSelector: #initFixed;
		              activeControlSelector: #step;
		              initializeSimulation;
		              yourself.
	model := simulation cormasModel.
	(model entitiesOfClass: CMMockCow) first energy: 0.2.
	(model entitiesOfClass: CMMockGoat) first energy: 0.8.
	3 timesRepeat: [ simulation runStep ].
	chart := CMChart new
]

{ #category : 'tests' }
CMBoxSeriesRoassalTest >> testABoxAloneAtItsValueOfXIsCenteredOnIt [

	| cows goats data canvas centers |
	cows := CMBoxSeries new
		        x: #energy y: #energy ofAll: CMMockCow;
		        yourself.
	goats := CMBoxSeries new
		         x: #energy y: #energy ofAll: CMMockGoat;
		         yourself.
	chart
		add: cows;
		add: goats.
	data := {
		        (CMSeriesData
			         of: cows
			         named: 'cows'
			         color: Color blue
			         steps: #( 0 0 0 0 0 )
			         values: {
					         (1 @ 1).
					         (1 @ 2).
					         (1 @ 3).
					         (2 @ 1).
					         (2 @ 3) }).
		        (CMSeriesData
			         of: goats
			         named: 'goats'
			         color: Color red
			         steps: #( 0 0 0 0 )
			         values: {
					         (2 @ 2).
					         (2 @ 4).
					         (3 @ 1).
					         (3 @ 5) }) }.
	canvas := chart canvasOf: data hiding: Set new.
	centers := ((canvas allChildren select: [ :each | each model = #box ])
		            collect: [ :each | each encompassingRectangle center x ])
		           asSortedCollection asArray.
	self assert: centers size equals: 4.
	self assert: (centers second - centers first closeTo:
			 2 * (centers third - centers second))
]

{ #category : 'tests' }
CMBoxSeriesRoassalTest >> testABoxIsDrawnAtEachStep [

	| canvas |
	chart boxesX: #currentTimeStep y: #energy ofAll: CMMockAnimal.
	canvas := chart
		          canvasOf: (chart seriesDataOf: model in: simulation)
		          hiding: Set new.
	self
		assert: (canvas allChildren count: [ :each | each model = #box ])
		equals: 4
]

{ #category : 'tests' }
CMBoxSeriesRoassalTest >> testABoxSpansTheQuartilesOfItsValues [

	self
		assert: (CMBoxesPlot new fiveNumbersOf: #( 4 1 3 2 ))
		equals: #( 1 1.75 2.5 3.25 4 ).
	self
		assert: (CMBoxesPlot new fiveNumbersOf: #( 7 ))
		equals: #( 7 7 7 7 7 )
]

{ #category : 'tests' }
CMBoxSeriesRoassalTest >> testBoxesCanStandAtTheValuesOfAnyProbe [

	| plots |
	chart boxesX: #energy y: #energy ofAll: CMMockAnimal.
	plots := chart plotsOf: (chart seriesDataOf: model in: simulation).
	self
		assert: plots first value xValues asArray
		equals: #( 0.2 0.5 0.8 )
]

{ #category : 'tests' }
CMBoxSeriesRoassalTest >> testBoxesOfValuesThatAreNotNumbersCannotBeDrawn [

	chart boxesX: #currentTimeStep y: #state ofAll: CMMockCell.
	self
		should: [ chart seriesDataOf: model in: simulation ]
		raise: Error
		withExceptionDo: [ :error |
			self assert: (error messageText includesSubstring: 'state') ]
]

{ #category : 'tests' }
CMBoxSeriesRoassalTest >> testTheBoxOfEachStepGathersTheValuesOfAllInstancesAtThatStep [

	| plots |
	chart boxesX: #currentTimeStep y: #energy ofAll: CMMockAnimal.
	plots := chart plotsOf: (chart seriesDataOf: model in: simulation).
	self assert: plots size equals: 1.
	self assert: plots first value xValues asArray equals: #( 0 1 2 3 ).
	self
		assert: (plots first value yValues asArray first: 2)
		equals: #( 0.5 0.5 ).
	self
		assert: (plots first value yValues asArray last: 2)
		equals: #( 0.2 0.8 )
]

{ #category : 'tests' }
CMBoxSeriesRoassalTest >> testTheBoxesAreNamedAfterTheLabelOfTheirSeries [
	chart add: (CMBoxSeries new x: #currentTimeStep y: #energy ofAll: CMMockAnimal;
			 label: 'Energy';
			 yourself).
	self
		assert: (chart seriesDataOf: model in: simulation) first name
		equals: 'Energy'
]
