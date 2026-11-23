"
I test how a `CMPointSeries` is drawn with Roassal from the data recorded in a simulation of `CMMockModel`.
"
Class {
	#name : 'CMPointSeriesRoassalTest',
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
CMPointSeriesRoassalTest >> chartOfAllAnimalsAtShownStep [

	^ CMChart new
		  add: (CMPointSeries new
				   x: #energy y: #energy ofAll: CMMockAnimal;
				   atShownStep;
				   yourself);
		  yourself
]

{ #category : 'tests' }
CMPointSeriesRoassalTest >> labelNamed: aString in: aCanvas [

	^ aCanvas allChildren detect: [ :each |
		  (each isKindOf: RSLabel) and: [ each text = aString ] ]
]

{ #category : 'tests' }
CMPointSeriesRoassalTest >> plotUpToStep: aStep [

	^ (chart plotsOf: (chart atShownStep:
			    ((chart seriesDataOf: model in: simulation) collect: [ :each |
				     each upToStep: aStep ]))) first value
]

{ #category : 'tests' }
CMPointSeriesRoassalTest >> setUp [

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
	3 timesRepeat: [ simulation runStep ]
]

{ #category : 'tests' }
CMPointSeriesRoassalTest >> testAPointOfAMethodThatIsNotAProbeOnXRaisesAnError [

	chart := CMChart new
		         pointsX: #numberOfRows y: #numberOfDeadCells;
		         yourself.
	self
		should: [ chart seriesDataOf: model in: simulation ]
		raise: Error
		withExceptionDo: [ :error |
			self assert: (error messageText includesSubstring: '#numberOfRows') ]
]

{ #category : 'tests' }
CMPointSeriesRoassalTest >> testPointsAreLargeAndTranslucentSoThatThePointsBehindThemShow [

	| canvas points |
	chart := CMChart new
		         pointsX: #numberOfAliveCells y: #numberOfDeadCells;
		         yourself.
	canvas := chart
		          canvasOf: (chart seriesDataOf: model in: simulation)
		          hiding: Set new.
	points := canvas allChildren select: [ :each |
		          each isKindOf: RSEllipse ].
	self assert: points notEmpty.
	self assert: (points allSatisfy: [ :each |
			 each extent x >= 8 and: [ each color alpha < 1 ] ])
]

{ #category : 'tests' }
CMPointSeriesRoassalTest >> testThePointsOfAllInstancesAreAPointForEachInstanceAtTheLastStep [

	| plot energies |
	chart := self chartOfAllAnimalsAtShownStep.
	plot := self plotUpToStep: Float infinity.
	energies := ((model allEntitiesOfClass: CMMockAnimal) collect: [
		             :each | each energy ]) asArray sorted.
	self assert: energies size > 1.
	self assert: plot yValues asArray sorted equals: energies.
	self assert: plot xValues asArray sorted equals: energies
]

{ #category : 'tests' }
CMPointSeriesRoassalTest >> testThePointsOfAllInstancesAreNamedAfterTheirSeries [

	chart := CMChart new
		         add: (CMPointSeries new
				          x: #energy y: #energy ofAll: CMMockAnimal;
				          label: 'Animals';
				          yourself);
		         yourself.
	self
		assert:
			((chart seriesDataOf: model in: simulation) collect: [ :each |
				 each name ]) asArray
		equals: #( 'Animals' )
]

{ #category : 'tests' }
CMPointSeriesRoassalTest >> testThePointsOfAllInstancesAtEveryStepAreAPointForEachInstanceAndStep [

	| plot |
	chart := CMChart new
		         pointsX: #currentTimeStep y: #energy ofAll: CMMockAnimal;
		         yourself.
	plot := self plotUpToStep: Float infinity.
	self assert: plot xValues asArray sorted equals: #( 0 0 1 1 2 2 3 3 )
]

{ #category : 'tests' }
CMPointSeriesRoassalTest >> testThePointsOfTheModelAreAPointForEachRecordedStep [

	| plot data |
	chart := CMChart new
		         pointsX: #numberOfAliveCells y: #numberOfDeadCells;
		         yourself.
	plot := self plotUpToStep: Float infinity.
	data := simulation dataOf: model.
	self assert: data size equals: 4.
	self
		assert: plot xValues asArray
		equals: (data column: #numberOfAliveCells) asArray.
	self
		assert: plot yValues asArray
		equals: (data column: #numberOfDeadCells) asArray
]

{ #category : 'tests' }
CMPointSeriesRoassalTest >> testThePointsUpToAnEarlierStepShowTheInstancesAtThatStep [

	| plot |
	chart := self chartOfAllAnimalsAtShownStep.
	plot := self plotUpToStep: 0.
	self assert: plot yValues size equals: 2.
	self assert: plot yValues asSet size equals: 1
]

{ #category : 'tests' }
CMPointSeriesRoassalTest >> testValuesThatAreNotNumbersOnXAreShownInCategories [

	| canvas |
	chart := CMChart new.
	canvas := chart
		          canvasOf: { (CMSeriesData
				           of: (CMPointSeries new x: #level y: #energy)
				           named: 'a'
				           color: Color red
				           steps: #( 1 2 3 )
				           values: {
						           (Point x: 'low' y: 1).
						           (Point x: 'high' y: 2).
						           (Point x: 'low' y: 3) }) }
		          hiding: Set new.
	self assert: (self labelNamed: 'low' in: canvas) position x
		< (self labelNamed: 'high' in: canvas) position x
]

{ #category : 'tests' }
CMPointSeriesRoassalTest >> textsOf: aCanvas [

	^ (aCanvas allChildren select: [ :each | each isKindOf: RSLabel ])
		  collect: [ :each | each text ]
]
