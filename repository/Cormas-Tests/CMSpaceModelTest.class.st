"
A CMSpaceModelTest is a test class for testing the behavior of CMSpaceModel
"
Class {
	#name : #CMSpaceModelTest,
	#superclass : #CMTestObject,
	#instVars : [
		'spaceModel'
	],
	#category : #'Cormas-Tests-Space'
}

{ #category : #running }
CMSpaceModelTest >> setUp [
	super setUp.
	
	spaceModel := CMSpaceModel new
		cormasModel: self newTestModel;
		yourself.
]

{ #category : #accessing }
CMSpaceModelTest >> spaceModel [

	^ spaceModel
]

{ #category : #accessing }
CMSpaceModelTest >> spaceModel: anObject [

	spaceModel := anObject
]

{ #category : #test }
CMSpaceModelTest >> testAbsoluteBounds [

	| expected| 
	
	expected := Rectangle origin: 0 @ 0 extent: 50 @ 50.
	self assert: self spaceModel absoluteBounds equals: expected.
	expected := Rectangle origin: 0 @ 0 extent: 30 @ 30.	
	self spaceModel absoluteBounds: expected.
	self assert: self spaceModel absoluteBounds equals: expected.
	
]

{ #category : #test }
CMSpaceModelTest >> testAbsoluteHeight [

	self assert: self spaceModel absoluteHeight equals: 50.

	
]

{ #category : #test }
CMSpaceModelTest >> testAbsoluteWidth [

	self assert: self spaceModel absoluteWidth equals: 50.

]

{ #category : #test }
CMSpaceModelTest >> testAllOccupants [

	| expected |
	
	expected := OrderedCollection empty.
	self assert: self spaceModel allOccupants equals: expected.

]

{ #category : #test }
CMSpaceModelTest >> testClosed [

	self spaceModel closed: true.
	self assert: self spaceModel closed.

]

{ #category : #test }
CMSpaceModelTest >> testColumn [

	self spaceModel line: 2 column: 3.
	self assert: self spaceModel column equals: 3.

]

{ #category : #test }
CMSpaceModelTest >> testConnexity [

	self spaceModel initializeIrregular.
	self assert: self spaceModel connexity equals: 0.
	self spaceModel gridCellShape: #regular.
	
	self spaceModel nbNeighbours: #eight.
	self assert: self spaceModel connexity equals: 8.
	self spaceModel nbNeighbours: #four.
	self assert: self spaceModel connexity equals: 4.
	self spaceModel nbNeighbours: #six.
	self assert: self spaceModel connexity equals: 6.

]

{ #category : #test }
CMSpaceModelTest >> testIsIrregular [

	self spaceModel initializeIrregular.
	self assert: self spaceModel isIrregular.
	self spaceModel gridCellShape: #regular.
	self deny: self spaceModel isIrregular.

]

{ #category : #test }
CMSpaceModelTest >> testLineColumn [

	self spaceModel line: 2 column: 3.
	self assert: self spaceModel line equals: 2.
	self assert: self spaceModel column equals: 3.
	self assert: self spaceModel cardinal equals: 6.
]
