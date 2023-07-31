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
CMR3SpaceDiagramBuilderTest >> setUp [

	super setUp.
	
	model := CMMockModel new
		initializeSimulation;
		yourself.

	builder := CMR3SpaceDiagramBuilder new
		cormasModel: model;
		yourself.
		
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
