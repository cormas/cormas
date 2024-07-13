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
CMSpaceModelTest >> newModelWithClosedEnvironment [

	^ self spaceModel 
		initializeRegularLines: 9
		columns: 5
		nbType: 4
		closed: true;
		yourself
]

{ #category : #test }
CMSpaceModelTest >> newModelWithOpenEnvironment [

	^ self spaceModel 
		initializeRegularLines: 9
		columns: 5
		nbType: 4
		closed: false;
		yourself
]

{ #category : #running }
CMSpaceModelTest >> setUp [

	super setUp.		
	spaceModel := model spaceModel.
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
	
	expected := Rectangle origin: 0 @ 0 extent: 200 @ 200.
	self assert: self spaceModel absoluteBounds equals: expected.
	expected := Rectangle origin: 0 @ 0 extent: 30 @ 30.	
	self spaceModel absoluteBounds: expected.
	self assert: self spaceModel absoluteBounds equals: expected.
	
]

{ #category : #test }
CMSpaceModelTest >> testAbsoluteHeight [

	self assert: self spaceModel absoluteHeight equals: 200.

	
]

{ #category : #test }
CMSpaceModelTest >> testAbsoluteWidth [

	self assert: self spaceModel absoluteWidth equals: 200.

]

{ #category : #test }
CMSpaceModelTest >> testAllOccupants [

	self assert: self spaceModel allOccupants size equals: 6.

]

{ #category : #test }
CMSpaceModelTest >> testCellAtAt [

	self assert: (spaceModel cellAt: 1 at: 1) id equals: 1.
	self assert: (spaceModel cellAt: 1 at: 4) id equals: 4.
	
	self assert: (spaceModel cellAt: 2 at: 1) id equals: 5.
	self assert: (spaceModel cellAt: 2 at: 4) id equals: 8.
	
	self assert: (spaceModel cellAt: 3 at: 1) id equals: 9.
	self assert: (spaceModel cellAt: 3 at: 4) id equals: 12.
	
	self assert: (spaceModel cellAt: 4 at: 1) id equals: 13.
	self assert: (spaceModel cellAt: 4 at: 4) id equals: 16.
]

{ #category : #test }
CMSpaceModelTest >> testCellsOfLine [

	| cells |
	cells := self spaceModel cellsOfLine: 1.
	
	self assert: cells size equals: 4.
	
	cells withIndexDo: [ :each :i |
		self assert: (each isKindOf: CMMockCell).
		self assert: each id equals: i ].
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

	self assert: self newModelWithClosedEnvironment isClosedEnvironment.
	self deny: self newModelWithOpenEnvironment isClosedEnvironment.	
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
