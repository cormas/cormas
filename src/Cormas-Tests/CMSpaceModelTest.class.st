"
A CMSpaceModelTest is a test class for testing the behavior of CMSpaceModel
"
Class {
	#name : 'CMSpaceModelTest',
	#superclass : 'CMTestObject',
	#instVars : [
		'spaceModel'
	],
	#category : 'Cormas-Tests-Space',
	#package : 'Cormas-Tests',
	#tag : 'Space'
}

{ #category : 'test' }
CMSpaceModelTest >> newModelWithClosedEnvironment [

	^ self spaceModel 
		initializeRegularNumberOfRows: 9
		numberOfColumns: 5
		neighbourhood: 4
		closed: true;
		yourself
]

{ #category : 'test' }
CMSpaceModelTest >> newModelWithOpenEnvironment [

	^ self spaceModel 
		initializeRegularNumberOfRows: 9
		numberOfColumns: 5
		neighbourhood: 4
		closed: false;
		yourself
]

{ #category : 'running' }
CMSpaceModelTest >> setUp [

	super setUp.		
	spaceModel := model spaceModel.
]

{ #category : 'accessing' }
CMSpaceModelTest >> spaceModel [

	^ spaceModel
]

{ #category : 'accessing' }
CMSpaceModelTest >> spaceModel: anObject [

	spaceModel := anObject
]

{ #category : 'tests' }
CMSpaceModelTest >> testAllOccupants [

	self assert: self spaceModel allOccupants size equals: 2.

]

{ #category : 'tests' }
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

{ #category : 'tests' }
CMSpaceModelTest >> testCellsOfLine [

	| cells |
	cells := self spaceModel cellsOfLine: 1.
	
	self assert: cells size equals: 4.
	
	cells withIndexDo: [ :each :i |
		self assert: (each isKindOf: CMMockCell).
		self assert: each id equals: i ].
]

{ #category : 'tests' }
CMSpaceModelTest >> testIsIrregular [

	self spaceModel initializeIrregular.
	self assert: self spaceModel isIrregular.
	self spaceModel gridCellShape: #regular.
	self deny: self spaceModel isIrregular.

]

{ #category : 'tests' }
CMSpaceModelTest >> testIsNotTorroidal [

	self assert: self newModelWithClosedEnvironment isClosedEnvironment.
	self deny: self newModelWithOpenEnvironment isClosedEnvironment.	
]

{ #category : 'tests' }
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

{ #category : 'tests' }
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

{ #category : 'tests' }
CMSpaceModelTest >> testNbNeighbours [

	self spaceModel nbCount: 4.
	self assert: self spaceModel nbNeighbours equals: 4.
	self spaceModel nbCount: 3.
	self assert: self spaceModel nbNeighbours equals: 3.
	


]

{ #category : 'tests' }
CMSpaceModelTest >> testNumberOfRowsNumberOfColumns [

	self spaceModel numberOfRows: 2 numberOfColumns: 3.
	self assert: self spaceModel numberOfRows equals: 2.
	self assert: self spaceModel numberOfColumns equals: 3.
	self assert: self spaceModel gridSize equals: 6.
]
