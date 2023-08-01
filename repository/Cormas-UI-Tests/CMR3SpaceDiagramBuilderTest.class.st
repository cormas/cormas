Class {
	#name : #CMR3SpaceDiagramBuilderTest,
	#superclass : #TestCase,
	#instVars : [
		'model',
		'builder',
		'presenter'
	],
	#category : #'Cormas-UI-Tests-Core'
}

{ #category : #initialization }
CMR3SpaceDiagramBuilderTest >> initialCellColors [

	"Shape colors of a grid for the cells of the initial mock model with a fixed random seed"
	
	^ self initialCellStates collect: [ :each |
		each = #alive
			ifTrue: [ Color white ]
			ifFalse: [ Color black ] ]
]

{ #category : #initialization }
CMR3SpaceDiagramBuilderTest >> initialCellStates [

	"Initial cell states of a mock model with a fixed random seed"
	
	^ OrderedCollection withAll: #(
		dead dead alive dead
		alive dead dead alive
		dead dead dead dead
		dead alive dead dead).
]

{ #category : #initialization }
CMR3SpaceDiagramBuilderTest >> setUp [

	super setUp.
	
	model := CMMockModel new
		randomSeed: 42;
		initializeSimulation;
		yourself.

	builder := CMR3SpaceDiagramBuilder new
		cormasModel: model;
		yourself.
		
	builder build.
		
	presenter := builder asPresenter.
]

{ #category : #'as yet unclassified' }
CMR3SpaceDiagramBuilderTest >> testActivePoVsDictionaryIsDictionary [

	self assert: builder activePoVsDictionary isDictionary.
]

{ #category : #'as yet unclassified' }
CMR3SpaceDiagramBuilderTest >> testActivePoVsDictionaryIsEmpty [

	self assert: builder activePoVsDictionary isEmpty.
]

{ #category : #'as yet unclassified' }
CMR3SpaceDiagramBuilderTest >> testActiveSpatialEntityPovDefaultValue [

	self assert: builder activeSpatialEntityPov equals: #pov.
]

{ #category : #tests }
CMR3SpaceDiagramBuilderTest >> testChangeAgentShapeToTriangle [

	| canvas shape |
	
	builder masterAgent: RSShapeFactory triangle.
	
	canvas := RSCanvas new.
	builder container: canvas.
	builder build.
	
	shape := builder agentShapes anyOne.
	
	self assert: shape class equals: RSPolygon.
	self assert: shape points size equals: 3.
]

{ #category : #'as yet unclassified' }
CMR3SpaceDiagramBuilderTest >> testCormasModel [

	self assert: builder cormasModel equals: model.
]

{ #category : #'as yet unclassified' }
CMR3SpaceDiagramBuilderTest >> testCreateCellShapes [

	| shapes |
	shapes := builder createCellShapes.
	
	self assert: shapes size equals: model theESE size.
	self assert: shapes anyOne isShape.
]

{ #category : #'as yet unclassified' }
CMR3SpaceDiagramBuilderTest >> testInitialCellColors [
	
	| expectedColors actualColors |
	
	expectedColors := self initialCellColors.
	actualColors := builder cellShapes collect: [ :shape | shape color ].
	
	self assert: actualColors equals: expectedColors.
]

{ #category : #'as yet unclassified' }
CMR3SpaceDiagramBuilderTest >> testMasterCell [

	self assert: builder masterCell isShape.
]

{ #category : #'as yet unclassified' }
CMR3SpaceDiagramBuilderTest >> testNewCellShapeForModel [

	| cell shape |
	
	cell := model theESE first.
	shape := builder newCellShapeForModel: model theESE first.
	
	self assert: shape isShape.
	self assert: shape model equals: cell.
	self assert: shape announcer equals: builder masterCell announcer.

]

{ #category : #'as yet unclassified' }
CMR3SpaceDiagramBuilderTest >> testRandomSeedCells [

	"This test verifies that the random seed is fixed and the mock model is initialized with the expected combination of dead/alive cells."
	
	| expectedStates actualStates |
	
	expectedStates := self initialCellStates.
	actualStates := model theESE collect: [ :cell | cell state ].
	
	self assert: actualStates equals: expectedStates.
]

{ #category : #'as yet unclassified' }
CMR3SpaceDiagramBuilderTest >> testUpdateCellShapes [

	"Test if cell shapes are updated when model changes"
	
	| expectedColors actualColors |
	
	expectedColors := self updatedCellColors.
	
	model runStep.
	builder build.
	
	actualColors := builder cellShapes collect: [ :shape | shape color ].
	
	self assert: actualColors equals: expectedColors.
]

{ #category : #initialization }
CMR3SpaceDiagramBuilderTest >> updatedCellColors [

	"Shape colors of a grid for the cells of the mock model with a fixed random seed after one simulation step"
	
	^ self updatedCellStates collect: [ :each |
		each = #alive
			ifTrue: [ Color white ]
			ifFalse: [ Color black ] ]
]

{ #category : #initialization }
CMR3SpaceDiagramBuilderTest >> updatedCellStates [

	"Cell states of a mock model with a fixed random seed after one simulation step"
	
	^ OrderedCollection withAll: #(
		alive alive dead alive
		dead alive alive dead
		alive alive alive alive
		alive dead alive alive).
]
