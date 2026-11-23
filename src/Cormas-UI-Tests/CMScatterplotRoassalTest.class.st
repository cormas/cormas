"
I test how a `CMScatterplot` is drawn with Roassal from the data recorded in a simulation of `CMMockModel`.
"
Class {
	#name : 'CMScatterplotRoassalTest',
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
CMScatterplotRoassalTest >> labelNamed: aString in: aCanvas [

	^ aCanvas allChildren detect: [ :each |
		  (each isKindOf: RSLabel) and: [ each text = aString ] ]
]

{ #category : 'tests' }
CMScatterplotRoassalTest >> plotUpToStep: aStep [

	^ (chart plotsOf:
		   ((chart seriesDataOf: model in: simulation) collect: [ :each |
			    each upToStep: aStep ])) first value
]

{ #category : 'tests' }
CMScatterplotRoassalTest >> setUp [

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
CMScatterplotRoassalTest >> testAPointOfAMethodThatIsNotAProbeOnXRaisesAnError [

	chart := CMScatterplot new
		         pointsX: #numberOfRows y: #numberOfDeadCells;
		         yourself.
	self
		should: [ chart seriesDataOf: model in: simulation ]
		raise: Error
		withExceptionDo: [ :error |
			self assert: (error messageText includesSubstring: '#numberOfRows') ]
]

{ #category : 'tests' }
CMScatterplotRoassalTest >> testThePointsOfAllInstancesAreAPointForEachInstanceAtTheLastStep [

	| plot energies |
	chart := CMScatterplot new
		         pointsX: #energy y: #energy ofAll: CMMockAnimal;
		         yourself.
	plot := self plotUpToStep: Float infinity.
	energies := ((model allEntitiesOfClass: CMMockAnimal) collect: [
		             :each | each energy ]) asArray sorted.
	self assert: energies size > 1.
	self assert: plot yValues asArray sorted equals: energies.
	self assert: plot xValues asArray sorted equals: energies
]

{ #category : 'tests' }
CMScatterplotRoassalTest >> testThePointsOfAllInstancesAreNamedAfterTheirSeries [

	chart := CMScatterplot new
		         add: (CMPointSeries new
				          probeX: #energy y: #energy ofAll: CMMockAnimal;
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
CMScatterplotRoassalTest >> testThePointsOfTheModelAreAPointForEachRecordedStep [

	| plot data |
	chart := CMScatterplot new
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
CMScatterplotRoassalTest >> testThePointsUpToAnEarlierStepShowTheInstancesAtThatStep [

	| plot |
	chart := CMScatterplot new
		         pointsX: #energy y: #energy ofAll: CMMockAnimal;
		         yourself.
	plot := self plotUpToStep: 0.
	self assert: plot yValues size equals: 2.
	self assert: plot yValues asSet size equals: 1
]

{ #category : 'tests' }
CMScatterplotRoassalTest >> testValuesThatAreNotNumbersOnXAreShownInCategories [

	| canvas |
	chart := CMScatterplot new.
	canvas := chart
		          canvasOf: { (CMSeriesData
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
CMScatterplotRoassalTest >> textsOf: aCanvas [

	^ (aCanvas allChildren select: [ :each | each isKindOf: RSLabel ])
		  collect: [ :each | each text ]
]
