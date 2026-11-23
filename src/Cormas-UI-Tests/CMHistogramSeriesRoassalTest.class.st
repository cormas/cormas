Class {
	#name : 'CMHistogramSeriesRoassalTest',
	#superclass : 'TestCase',
	#instVars : [
		'simulation',
		'model',
		'chart'
	],
	#category : 'Cormas-UI-Tests',
	#package : 'Cormas-UI-Tests'
}

{ #category : 'tests' }
CMHistogramSeriesRoassalTest >> countsUpToStep: aStep [

	^ (chart plotsOf: (chart atShownStep:
			    ((chart seriesDataOf: model in: simulation) collect: [ :each |
				     each upToStep: aStep ]))) first value yValues
]

{ #category : 'running' }
CMHistogramSeriesRoassalTest >> setUp [

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
		         add: (CMHistogramSeries new
				          x: #energy ofAll: CMMockAnimal;
				          atShownStep;
				          yourself);
		         yourself
]

{ #category : 'tests' }
CMHistogramSeriesRoassalTest >> testAHistogramOfEveryStepCountsTheValuesOfAllTheRecordedSteps [

	| counts |
	chart := CMChart new
		         histogramX: #energy ofAll: CMMockAnimal;
		         yourself.
	counts := self countsUpToStep: Float infinity.
	self assert: counts sum equals: 2 * 4
]

{ #category : 'tests' }
CMHistogramSeriesRoassalTest >> testEachWholeNumberHasABinOfItsOwn [

	| series counts |
	series := CMSeriesData
		          of: chart series first
		          named: 'neighbours'
		          color: Color red
		          steps: #( 0 0 0 0 )
		          values: #( 1 2 3 3 ).
	counts := (chart plotsOf: { series }) first value yValues.
	self
		assert: (counts reject: [ :each | each = 0 ]) asArray
		equals: #( 1 1 2 )
]

{ #category : 'tests' }
CMHistogramSeriesRoassalTest >> testTheBarsCountTheInstancesInEachBinAtTheLastStep [

	| counts |
	counts := self countsUpToStep: Float infinity.
	self assert: counts sum equals: 2.
	self assert: (counts count: [ :each | each > 0 ]) equals: 2
]

{ #category : 'tests' }
CMHistogramSeriesRoassalTest >> testTheBarsUpToAnEarlierStepCountTheInstancesAtThatStep [

	| counts |
	counts := self countsUpToStep: 0.
	self assert: counts sum equals: 2.
	self assert: (counts count: [ :each | each > 0 ]) equals: 1
]

{ #category : 'tests' }
CMHistogramSeriesRoassalTest >> testValuesSpreadOverAWideRangeAreCountedInAboutThirtyBins [

	| series counts |
	series := CMSeriesData
		          of: chart series first
		          named: 'energy'
		          color: Color red
		          steps: ((1 to: 100) collect: [ :each | 0 ])
		          values: ((1 to: 100) collect: [ :each | each + 0.5 ]).
	counts := (chart plotsOf: { series }) first value yValues.
	self assert: (counts size between: 20 and: 40)
]
