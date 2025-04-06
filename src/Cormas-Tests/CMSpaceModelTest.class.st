"
A CMSpaceModelTest is a test class for testing the behavior of CMSpaceModel
"
Class {
	#name : #CMSpaceModelTest,
	#superclass : #CMTestObject,
	#instVars : [
		'spaceModel'
	],
	#category : 'Cormas-Tests-Space'
}

{ #category : #test }
CMSpaceModelTest >> newModelWithClosedEnvironment [

	^ self spaceModel 
		initializeRegularNumberOfRows: 9
		numberOfColumns: 5
		neighbourhood: 4
		closed: true;
		yourself
]

{ #category : #test }
CMSpaceModelTest >> newModelWithOpenEnvironment [

	^ self spaceModel 
		initializeRegularNumberOfRows: 9
		numberOfColumns: 5
		neighbourhood: 4
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

{ #category : #tests }
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

{ #category : #tests }
CMSpaceModelTest >> testCellsOfLine [

	| cells |
	cells := self spaceModel cellsOfRow: 1.
	
	self assert: cells size equals: 4.
	
	cells withIndexDo: [ :each :i |
		self assert: (each isKindOf: CMMockCell).
		self assert: each id equals: i ].
]

{ #category : #tests }
CMSpaceModelTest >> testIsNotTorroidal [

	self assert: self newModelWithClosedEnvironment isClosedEnvironment.
	self deny: self newModelWithOpenEnvironment isClosedEnvironment.	
]

{ #category : #tests }
CMSpaceModelTest >> testNeighbourhoodConfiguration [

	self spaceModel numberOfNeighbours: 4.
	self assert: (self spaceModel neighbourhoodConfiguration isKindOf: CMSpace4Neighbourhood).
	
	self spaceModel numberOfNeighbours: 8.
	self assert: (self spaceModel neighbourhoodConfiguration isKindOf: CMSpace8Neighbourhood).
	
	self spaceModel neighbourhoodConfiguration: nil.
	self assert: self spaceModel neighbourhoodConfiguration isNil.
]

{ #category : #tests }
CMSpaceModelTest >> testNumberOfNeighbours [

	self spaceModel numberOfNeighbours: 4.
	self assert: self spaceModel numberOfNeighbours equals: 4.
	self spaceModel numberOfNeighbours: 8.
	self assert: self spaceModel numberOfNeighbours equals: 8.
	


]

{ #category : #tests }
CMSpaceModelTest >> testNumberOfRowsNumberOfColumns [

	self spaceModel numberOfRows: 2 numberOfColumns: 3.
	self assert: self spaceModel numberOfRows equals: 2.
	self assert: self spaceModel numberOfColumns equals: 3.
	self assert: self spaceModel gridSize equals: 6.
]
