Class {
	#name : #CMR3SpaceShapeBuilderTest,
	#superclass : #TestCase,
	#instVars : [
		'fixture',
		'builder'
	],
	#category : #'Cormas-UI-Tests-Core'
}

{ #category : #initialization }
CMR3SpaceShapeBuilderTest >> setUp [

	super setUp.
	
	fixture := CMR3SpaceTestFixture new.
	builder := CMR3SpaceCellsBuilder for: fixture builder.
]

{ #category : #'as yet unclassified' }
CMR3SpaceShapeBuilderTest >> testActivePoVsDictionaryIsDictionary [

	self assert: builder activePoVsDictionary isDictionary.
]

{ #category : #'as yet unclassified' }
CMR3SpaceShapeBuilderTest >> testActivePoVsDictionaryIsEmpty [

	self assert: builder activePoVsDictionary isEmpty.
]

{ #category : #'as yet unclassified' }
CMR3SpaceShapeBuilderTest >> testActiveSpatialEntityPovDefaultValue [

	self assert: builder activeSpatialEntityPov equals: #pov.
]
