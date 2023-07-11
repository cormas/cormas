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

{ #category : #test }
CMSpaceModelTest >> newNotTorroidalSpaceModel [

	^ self spaceModel 
		initializeRegularLines: 9
		columns: 5
		nbType: 4
		closed: false;
		yourself
]

{ #category : #test }
CMSpaceModelTest >> newTorroidalSpaceModel [

	^ self spaceModel 
		initializeRegularLines: 9
		columns: 5
		nbType: 4
		closed: true;
		yourself
]

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

	self assert: self spaceModel allOccupants size equals: 5.

]

{ #category : #test }
CMSpaceModelTest >> testCellsOfLine [

	| result |

	self spaceModel 
		nbCount: 4;
		dimensions: #(2 2).
	result := self spaceModel cellsOfLine: 1.
	
	self assert: (result first isKindOf: CMMockCell).
	self assert: (result second isKindOf: CMMockCell).

	self assert: result first id equals: 1.
	self assert: result second id equals: 2.

	self assert: result first neighbourhood size equals: 2.
	self assert: result second neighbourhood size equals: 3.	
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
	
	self spaceModel 
		line: 10 column: 10;	
		gridCellShape: #regular.

	self spaceModel nbCount: #eight.
	self assert: self spaceModel connexity equals: 8.
	self spaceModel nbCount: #four.
	self assert: self spaceModel connexity equals: 4.
	self spaceModel nbCount: #six.
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
CMSpaceModelTest >> testIsNotTorroidal [

	self assert: self newTorroidalSpaceModel isNotTorroidal.
	self deny: self newNotTorroidalSpaceModel isNotTorroidal.	
]

{ #category : #test }
CMSpaceModelTest >> testLine [

	self assert: self spaceModel line equals: CMSpaceModel defaultLines.
	self spaceModel dimensions: 2 -> 2.
	self assert: self spaceModel line equals: 2.
	


]

{ #category : #test }
CMSpaceModelTest >> testLineColumn [

	self spaceModel line: 2 column: 3.
	self assert: self spaceModel line equals: 2.
	self assert: self spaceModel column equals: 3.
	self assert: self spaceModel gridSize equals: 6.
]

{ #category : #test }
CMSpaceModelTest >> testNbConfiguration [

	self spaceModel nbCount: 4.
	self assert: (self spaceModel nbConfiguration isKindOf: CMSpace4Neighbourhood).
	
	self spaceModel nbCount: 8.
	self assert: (self spaceModel nbConfiguration isKindOf: CMSpace8Neighbourhood). 

	self spaceModel nbCount: 3.
	self assert: (self spaceModel nbConfiguration isKindOf: CMSpace3Neighbourhood). 
	
	self spaceModel nbConfiguration: nil.
	self assert: self spaceModel nbConfiguration isNil.
]

{ #category : #test }
CMSpaceModelTest >> testNbCount [

	self spaceModel nbCount: 4.
	self assert: self spaceModel nbNeighbours equals: 4.
	self spaceModel nbCount: 3.
	self assert: self spaceModel nbNeighbours equals: 3.

	self spaceModel nbCount: #four.
	self assert: self spaceModel nbNeighbours equals: 4.
	self spaceModel nbCount: #six.
	self assert: self spaceModel nbNeighbours equals: 6.
]

{ #category : #test }
CMSpaceModelTest >> testNbNeighbours [

	self spaceModel nbCount: 4.
	self assert: self spaceModel nbNeighbours equals: 4.
	self spaceModel nbCount: 3.
	self assert: self spaceModel nbNeighbours equals: 3.
	


]
