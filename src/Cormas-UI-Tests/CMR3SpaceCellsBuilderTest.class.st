Class {
	#name : #CMR3SpaceCellsBuilderTest,
	#superclass : #TestCase,
	#instVars : [
		'fixture',
		'builder',
		'model'
	],
	#category : 'Cormas-UI-Tests-Core'
}

{ #category : #initialization }
CMR3SpaceCellsBuilderTest >> setUp [

	super setUp.
	
	fixture := CMR3SpaceTestFixture new.
	builder := CMR3SpaceCellsBuilder for: fixture builder.
	model := fixture model.
]

{ #category : #'as yet unclassified' }
CMR3SpaceCellsBuilderTest >> testMasterShape [

	self assert: builder masterShape isShape.
]

{ #category : #'as yet unclassified' }
CMR3SpaceCellsBuilderTest >> testShapeForIndex [

	| cell shape |
	
	cell := model cells first.
	shape := builder shapeFor: model cells first index: 1.
	
	self assert: shape isShape.
	self assert: shape model equals: cell.
	self assert: shape announcer equals: builder masterShape announcer.

]

{ #category : #'as yet unclassified' }
CMR3SpaceCellsBuilderTest >> testShapesFor [

	| shapes |
	shapes := builder shapesFor: model cells.
	
	self assert: shapes size equals: model cells size.
	self assert: shapes anyOne isShape.
]
