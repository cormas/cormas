Class {
	#name : 'CMAbstractModelTest',
	#superclass : 'CMTestObject',
	#category : 'Cormas-Tests-Model',
	#package : 'Cormas-Tests',
	#tag : 'Model'
}

{ #category : 'test' }
CMAbstractModelTest >> sampleModelName [

	^ 'CMXXXModel'
]

{ #category : 'tests-accessing-entities' }
CMAbstractModelTest >> sampleModelNameWithoutPrefix [

	^ 'SampleModel'
]

{ #category : 'tests' }
CMAbstractModelTest >> testCellAtAt [

	| expectedCell expectedId actualCell |
	
	expectedCell := model spaceModel cellAt: 3 at: 2.
	expectedId := 10.
	
	actualCell := model cellAt: 3 at: 2.

	self assert: actualCell equals: expectedCell.
	self assert: actualCell id equals: expectedId.
]

{ #category : 'tests' }
CMAbstractModelTest >> testCellClass [

	self assert: CMMockModel cellClass equals: CMMockCell
]

{ #category : 'tests-accessing-entities' }
CMAbstractModelTest >> testCentralCell [
	| m |
	m := CMMockModel new
		createGridNumberOfRows: 3
			numberOfColumns: 3
			neighbourhood: 4
			closed: true;
		yourself.
	self
		assert: m centralCell
		identicalTo: (m selectCellsOfColumn: 2) second
]

{ #category : 'tests' }
CMAbstractModelTest >> testCreateGridXYNeighborHoodClosed [

	self assert: model allTheEntities size equals: (4 * 4) + 2.
	self assert: (model selectCellsOfColumn: 1) size equals: 4.
	self assert: (model selectCellsOfLine: 1) size equals: 4
]

{ #category : 'tests' }
CMAbstractModelTest >> testDominance [
	| m |
	m := CMMockModel new
		createGridNumberOfRows: 100
			numberOfColumns: 100
			neighbourhood: 4
			closed: true;
		yourself.
	self assert: (m dominance: #state) < 1.0.

]

{ #category : 'tests' }
CMAbstractModelTest >> testDominance1 [
	| m |
	m := CMMockModel new
		createGridNumberOfRows: 100
			numberOfColumns: 100
			neighbourhood: 4
			closed: true;
		yourself.
	self assert: (m dominance: #state) < 1.0
]

{ #category : 'tests-accessing-entities' }
CMAbstractModelTest >> testLowerLeftCell [
	| m |
	m := CMMockModel new
		createGridNumberOfRows: 3
			numberOfColumns: 3
			neighbourhood: 4
			closed: true;
		yourself.
	self
		assert: m lowerLeftCell
		identicalTo: (m selectCellsOfColumn: 1) third
]

{ #category : 'tests-accessing-entities' }
CMAbstractModelTest >> testLowerRightCell [
	| m |
	m := CMMockModel new
		createGridNumberOfRows: 3
			numberOfColumns: 3
			neighbourhood: 4
			closed: true;
		yourself.
	self
		assert: m lowerRightCell
		identicalTo: (m selectCellsOfColumn: 3) third
]

{ #category : 'tests-accessing-entities' }
CMAbstractModelTest >> testPickRandomCell [
	| cell |

	cell := model pickRandomCell.
	self assert: cell isSpatialEntity.
	self assert: (cell columnNumber between: 1 and: 10).
	self assert: (cell rowNumber between: 1 and: 20)
]

{ #category : 'tests-accessing-entities' }
CMAbstractModelTest >> testPickRandomCellConstrainedBy [
	| m |
	m := CMMockModel new
		createGridNumberOfRows: 9
			numberOfColumns: 9
			neighbourhood: 4
			closed: true;
		yourself.
	m centralCell state: #alive.
	self
		assert: (m pickRandomCellConstrainedBy: [ :cell | cell state = #alive ]) state
		equals: #alive.
	m centralCell state: #dead.
	self
		assert: (m pickRandomCellConstrainedBy: [ :cell | cell state = #dead ]) state
		equals: #dead
]

{ #category : 'tests-accessing-entities' }
CMAbstractModelTest >> testPickRandomCellWithoutAnyOccupantsOfClass [

	| cell |
	cell := model pickRandomCellWithoutAnyOccupantsOfClass: CMMockCow.
	self assert: (cell occupantsOfClass: CMMockCow) isEmpty
]

{ #category : 'tests-accessing-entities' }
CMAbstractModelTest >> testPickRandomCells [

	self assert: ((model pickRandomCells: 5) allSatisfy: #isSpatialEntity)
]

{ #category : 'tests-accessing-entities' }
CMAbstractModelTest >> testPickRandomEntitiesOfClass [

	| collection |
	collection := model pickRandomEntities: 5 ofClass: CMMockCell.
	
	self assert: collection size equals: 5.
	self assert: (collection allSatisfy: [ :each | each class = CMMockCell ])
]

{ #category : 'tests-accessing-entities' }
CMAbstractModelTest >> testPickRandomEntitiesOfClassConstrainedBy [

	self
		assert:
			((model
				pickRandomEntities: 5
				ofClass: CMMockCell
				constrainedBy: [ :cell | cell columnNumber = 5 ])
				allSatisfy: [ :cell | cell columnNumber = 5 ])
]

{ #category : 'tests-accessing-entities' }
CMAbstractModelTest >> testPickRandomEntityOfClass [

	self assert: (model pickRandomEntityOfClass: CMMockCell) isSpatialEntity
]

{ #category : 'tests-accessing-entities' }
CMAbstractModelTest >> testPickRandomEntityOfClassConstrainedBy [

	| cell1 cell2 |
	
	cell1 := model
		pickRandomEntityOfClass: CMMockCell
		constrainedBy: [ :cell | cell columnNumber = 1 ].
		
	cell2 := model
		pickRandomEntityOfClass: CMMockCell
		constrainedBy: [ :cell | cell columnNumber = 4 ].

	self assert: cell1 columnNumber equals: 1.
	self assert: cell2 columnNumber equals: 4.
]

{ #category : 'tests-accessing-entities' }
CMAbstractModelTest >> testPickRandomUnoccupiedCell [

	self assert: model pickRandomUnoccupiedCell theOccupants isEmpty
]

{ #category : 'tests-accessing-entities' }
CMAbstractModelTest >> testSelectCellsBetweenLine1Line2AndColumn1Column2 [

	| m cells |
	
	m := CMMockModel new
		createGridNumberOfRows: 20
			numberOfColumns: 10
			neighbourhood: 4
			closed: true;
		yourself.
	cells := m
		selectCellsBetweenLine1: 13
		line2: 15
		andColumn1: 6
		column2: 8.
	self assert: cells size equals: 9.
	cells do: [ :cell | 
		self assert: (cell columnNumber between: 6 and: 8).
		self assert: (cell rowNumber between: 13 and: 15) ]
]

{ #category : 'tests-accessing-entities' }
CMAbstractModelTest >> testSelectCellsInRectangleOriginCellCornerCell [
	| m cells |
	m := CMMockModel new
		createGridNumberOfRows: 9
			numberOfColumns: 5
			neighbourhood: 4
			closed: true;
		yourself.
	cells := m
		selectCellsInRectangleOriginCell: m upperLeftCell
		cornerCell: m centralCell.
	self assert: cells size equals: 15.
	cells do: [ :cell | 
			self assert: (cell columnNumber between: 1 and: 3).
			self assert: (cell rowNumber between: 1 and: 5) ]
]

{ #category : 'tests-accessing-entities' }
CMAbstractModelTest >> testSelectCellsOfColumn [

	1 to: 4 do: [ :column | 
		1 to: 4 do: [ :line | 
			self
				assert: ((model selectCellsOfColumn: column) at: line)
				identicalTo: ((model selectCellsOfLine: line) at: column) ] ]
]

{ #category : 'tests-accessing-entities' }
CMAbstractModelTest >> testSelectCellsOfLine [

	1 to: 4 do: [ :line | 
		| cells |
		cells := model selectCellsOfLine: line.
		self assert: cells size equals: 4.
		cells do: [ :cell | self assert: cell rowNumber equals: line ] ]
]

{ #category : 'tests' }
CMAbstractModelTest >> testShortestDistanceToCellsVerifying [
	| m |
	m := CMMockModel new.
	(m allTheEntities: CMMockCell)
		do: [ :cell | 
			self assert: (cell shortestDistanceToCellsVerifying: [ :c | c state = #dead | (c state = #alive) ])
				equals: 1 ]
]

{ #category : 'tests' }
CMAbstractModelTest >> testSpacialClasses [
	self
		assert: CMMockModel spatialClasses
		equals: (OrderedCollection with: CMMockCell)
]

{ #category : 'tests-accessing-entities' }
CMAbstractModelTest >> testTheAgents [

	| agents |
	agents := model theAgents.
	self assert: agents size equals: 2.
	
	agents do: [ :agent |
		self assert: (agent isKindOf: CMMockAnimal) ]
]

{ #category : 'tests-accessing-entities' }
CMAbstractModelTest >> testUpperLeftCell [
	| m |
	m := CMMockModel new
		createGridNumberOfRows: 3
			numberOfColumns: 3
			neighbourhood: 4
			closed: true;
		yourself.
	self
		assert: m upperLeftCell
		identicalTo: (m selectCellsOfColumn: 1) first
]

{ #category : 'tests-accessing-entities' }
CMAbstractModelTest >> testUpperRightCell [
	| m |
	m := CMMockModel new
		createGridNumberOfRows: 3
			numberOfColumns: 3
			neighbourhood: 4
			closed: true;
		yourself.
	self
		assert: m upperRightCell
		identicalTo: (m selectCellsOfColumn: 3) first
]
