Class {
	#name : 'CMBoxplotRoassalTest',
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
CMBoxplotRoassalTest >> setUp [

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
	chart := CMBoxplot new
]

{ #category : 'tests' }
CMBoxplotRoassalTest >> testABoxIsDrawnAtEachStep [

	| canvas |
	chart boxes: #energy ofAll: CMMockAnimal.
	canvas := chart
		          canvasOf: (chart seriesDataOf: model in: simulation)
		          hiding: Set new.
	self
		assert: (canvas allChildren count: [ :each | each model = #box ])
		equals: 4
]

{ #category : 'tests' }
CMBoxplotRoassalTest >> testABoxSpansTheQuartilesOfItsValues [

	self
		assert: (CMBoxesPlot new fiveNumbersOf: #( 4 1 3 2 ))
		equals: #( 1 1.75 2.5 3.25 4 ).
	self
		assert: (CMBoxesPlot new fiveNumbersOf: #( 7 ))
		equals: #( 7 7 7 7 7 )
]

{ #category : 'tests' }
CMBoxplotRoassalTest >> testBoxesOfValuesThatAreNotNumbersCannotBeDrawn [

	chart boxes: #state ofAll: CMMockCell.
	self
		should: [ chart seriesDataOf: model in: simulation ]
		raise: Error
		withExceptionDo: [ :error |
			self assert: (error messageText includesSubstring: 'state') ]
]

{ #category : 'tests' }
CMBoxplotRoassalTest >> testTheBoxOfEachStepGathersTheValuesOfAllInstancesAtThatStep [

	| series |
	chart boxes: #energy ofAll: CMMockAnimal.
	series := chart seriesDataOf: model in: simulation.
	self assert: series size equals: 1.
	self assert: series first steps asArray equals: #( 0 1 2 3 ).
	self assert: series first values first asArray equals: #( 0.5 0.5 ).
	self assert: series first values last asArray equals: #( 0.2 0.8 )
]
