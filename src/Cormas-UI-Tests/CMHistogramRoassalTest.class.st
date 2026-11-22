Class {
	#name : 'CMHistogramRoassalTest',
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
CMHistogramRoassalTest >> setUp [

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
	chart := CMHistogram new
		         bars: #energy ofAll: CMMockAnimal;
		         yourself
]

{ #category : 'tests' }
CMHistogramRoassalTest >> testEachWholeNumberHasABinOfItsOwn [

	| series counts |
	series := CMChartSeries
		          named: 'neighbours'
		          color: Color red
		          steps: #( 0 )
		          values: #( #( 1 2 3 3 ) ).
	counts := (chart plotsOf: { series }) first value yValues.
	self
		assert: (counts reject: [ :each | each = 0 ]) asArray
		equals: #( 1 1 2 )
]

{ #category : 'tests' }
CMHistogramRoassalTest >> testTheBarsCountTheInstancesInEachBinAtTheLastStep [

	| counts |
	counts := (chart plotsOf: (chart seriesOf: model in: simulation))
		          first value yValues.
	self assert: counts sum equals: 2.
	self assert: (counts count: [ :each | each > 0 ]) equals: 2
]

{ #category : 'tests' }
CMHistogramRoassalTest >> testTheBarsUpToAnEarlierStepCountTheInstancesAtThatStep [

	| counts |
	counts := (chart plotsOf:
		           ((chart seriesOf: model in: simulation) collect: [ :each |
			            each upToStep: 0 ])) first value yValues.
	self assert: counts sum equals: 2.
	self assert: (counts count: [ :each | each > 0 ]) equals: 1
]
