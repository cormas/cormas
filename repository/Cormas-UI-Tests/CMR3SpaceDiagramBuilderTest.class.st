Class {
	#name : #CMR3SpaceDiagramBuilderTest,
	#superclass : #TestCase,
	#instVars : [
		'fixture',
		'model',
		'builder',
		'presenter'
	],
	#category : #'Cormas-UI-Tests-Core'
}

{ #category : #initialization }
CMR3SpaceDiagramBuilderTest >> setUp [
	
	super setUp.
	
	fixture := CMR3SpaceTestFixture new.
	
	model := fixture model.
	builder := fixture builder.
	presenter := fixture presenter.
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
	
	builder masterShapeForAgents: RSShapeFactory triangle.
	
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
CMR3SpaceDiagramBuilderTest >> testInitialCellColors [
	
	| expectedColors actualColors |
	
	expectedColors := fixture initialCellColors.
	actualColors := builder cellShapes asOrderedCollection collect: [ :shape | shape color ].
	
	self assert: actualColors equals: expectedColors.
]

{ #category : #'as yet unclassified' }
CMR3SpaceDiagramBuilderTest >> testRandomSeedCells [

	"This test verifies that the random seed is fixed and the mock model is initialized with the expected combination of dead/alive cells."
	
	| expectedStates actualStates |
	
	expectedStates := fixture initialCellStates.
	actualStates := model theCells collect: [ :cell | cell state ].
	
	self assert: actualStates equals: expectedStates.
]

{ #category : #'as yet unclassified' }
CMR3SpaceDiagramBuilderTest >> testUpdateCellShapes [

	"Test if cell shapes are updated when model changes"
	
	| expectedColors actualColors |
	
	expectedColors := fixture updatedCellColors.
	
	model runStep.
	builder build.
	
	actualColors := builder cellShapes asOrderedCollection collect: [ :shape | shape color ].
	
	self assert: actualColors equals: expectedColors.
]
