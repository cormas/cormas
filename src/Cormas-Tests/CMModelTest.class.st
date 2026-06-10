Class {
	#name : 'CMModelTest',
	#superclass : 'CMTestObject',
	#category : 'Cormas-Tests-Model',
	#package : 'Cormas-Tests',
	#tag : 'Model'
}

{ #category : 'test' }
CMModelTest >> sampleModelName [

	^ 'CMXXXModel'
]

{ #category : 'tests-accessing-entities' }
CMModelTest >> sampleModelNameWithoutPrefix [

	^ 'SampleModel'
]

{ #category : 'tests-accessing-entities' }
CMModelTest >> testAgents [

	| agents |
	agents := model agents.
	self assert: agents size equals: 2.
	
	agents do: [ :agent |
		self assert: (agent isKindOf: CMMockAnimal) ]
]

{ #category : 'tests' }
CMModelTest >> testCellAt [
	| m |
	m := CMMockModel new
		     createGridNumberOfRows: 3
		     numberOfColumns: 3
		     neighbourhood: 4
		     closed: true;
		     yourself.
	self
		assert: (m cellAt: 4)
		identicalTo: (m selectCellsOfColumn: 1) second
]

{ #category : 'tests' }
CMModelTest >> testCellAtAt [

	| expectedCell expectedId actualCell |
	
	expectedCell := model spaceModel cellAt: 3 at: 2.
	expectedId := 10.
	
	actualCell := model cellAt: 3 at: 2.

	self assert: actualCell equals: expectedCell.
	self assert: actualCell id equals: expectedId.
]

{ #category : 'tests' }
CMModelTest >> testCellAtId [
	| m |
	m := CMMockModel new
		     createGridNumberOfRows: 3
		     numberOfColumns: 3
		     neighbourhood: 4
		     closed: true;
		     yourself.
	self
		assert: (m cellAtId: 4)
		identicalTo: (m selectCellsOfColumn: 1) second
]

{ #category : 'tests' }
CMModelTest >> testCellClass [

	self assert: model cellClass equals: CMMockCell
]

{ #category : 'tests-accessing-entities' }
CMModelTest >> testCells [

	| cells |
	cells := model cells.
	self assert: cells size equals: 16.
	
	cells do: [ :cell |
		self assert: (cell isKindOf: CMMockCell) ].
	
	1 to: 16 do: [ :i |
		self assert: (cells at: i) id equals: i ]
]

{ #category : 'tests-accessing-entities' }
CMModelTest >> testCellsBetweenRowAndRowColumnAndColumn [

	| m cells |
	
	m := CMMockModel new
		createGridNumberOfRows: 20
			numberOfColumns: 10
			neighbourhood: 4
			closed: true;
		yourself.
	cells := m
		selectCellsBetweenRow: 13
		andRow: 15
		column: 6
		andColumn: 8.
	self assert: cells size equals: 9.
	cells do: [ :cell | 
		self assert: (cell columnNumber between: 6 and: 8).
		self assert: (cell rowNumber between: 13 and: 15) ]
]

{ #category : 'tests-accessing-entities' }
CMModelTest >> testCentralCell [
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
CMModelTest >> testCreateGridXYNeighborHoodClosed [

	self assert: model allTheEntities size equals: (4 * 4) + 2.
	self assert: (model selectCellsOfColumn: 1) size equals: 4.
	self assert: (model selectCellsOfLine: 1) size equals: 4
]

{ #category : 'tests' }
CMModelTest >> testDominance [
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
CMModelTest >> testIsCormasAgentClass [
	
	self deny: Object isCormasAgentClass.
	self deny: Collection isCormasAgentClass.
	self deny: Trait isCormasAgentClass.
	self deny: TCMRandom isCormasAgentClass.
	self deny: CMMockModel isCormasAgentClass.
	self assert: CMMockGoat isCormasAgentClass.
	self deny: CMMockCell isCormasAgentClass
]

{ #category : 'tests' }
CMModelTest >> testIsCormasCellClass [
	
	self deny: Object isCormasCellClass.
	self deny: Collection isCormasCellClass.
	self deny: Trait isCormasCellClass.
	self deny: TCMRandom isCormasCellClass.
	self deny: CMMockModel isCormasCellClass.
	self deny: CMMockGoat isCormasCellClass.
	self assert: CMMockCell isCormasCellClass
]

{ #category : 'tests' }
CMModelTest >> testIsCormasModelClass [
	
	self deny: Object isCormasModelClass.
	self deny: Collection isCormasModelClass.
	self deny: Trait isCormasModelClass.
	self deny: TCMRandom isCormasModelClass.
	self assert: CMMockModel isCormasModelClass.
	self deny: CMMockGoat isCormasModelClass.
	self deny: CMMockCell isCormasModelClass
]

{ #category : 'tests-accessing-entities' }
CMModelTest >> testLowerLeftCell [
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
CMModelTest >> testLowerRightCell [
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
CMModelTest >> testPickRandomCell [
	| cell |

	cell := model pickRandomCell.
	self assert: cell isSpatialEntity.
	self assert: (cell columnNumber between: 1 and: 10).
	self assert: (cell rowNumber between: 1 and: 20)
]

{ #category : 'tests-accessing-entities' }
CMModelTest >> testPickRandomCellConstrainedBy [
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
CMModelTest >> testPickRandomCellWithoutAnyOccupantsOfClass [

	| cell |
	cell := model pickRandomCellWithoutAnyOccupantsOfClass: CMMockCow.
	self assert: (cell occupantsOfClass: CMMockCow) isEmpty
]

{ #category : 'tests-accessing-entities' }
CMModelTest >> testPickRandomCells [

	self assert: ((model pickRandomCells: 5) allSatisfy: #isSpatialEntity)
]

{ #category : 'tests-accessing-entities' }
CMModelTest >> testPickRandomEntitiesOfClass [

	| collection |
	collection := model pickRandomEntities: 5 ofClass: CMMockCell.
	
	self assert: collection size equals: 5.
	self assert: (collection allSatisfy: [ :each | each class = CMMockCell ])
]

{ #category : 'tests-accessing-entities' }
CMModelTest >> testPickRandomEntitiesOfClassConstrainedBy [

	self
		assert:
			((model
				pickRandomEntities: 5
				ofClass: CMMockCell
				constrainedBy: [ :cell | cell columnNumber = 5 ])
				allSatisfy: [ :cell | cell columnNumber = 5 ])
]

{ #category : 'tests-accessing-entities' }
CMModelTest >> testPickRandomEntityOfClass [

	self assert: (model pickRandomEntityOfClass: CMMockCell) isSpatialEntity
]

{ #category : 'tests-accessing-entities' }
CMModelTest >> testPickRandomEntityOfClassConstrainedBy [

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
CMModelTest >> testPickRandomUnoccupiedCell [

	self assert: model pickRandomUnoccupiedCell theOccupants isEmpty
]

{ #category : 'tests-accessing-entities' }
CMModelTest >> testSelectCellsInRectangleOriginCellCornerCell [
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
CMModelTest >> testSelectCellsOfColumn [

	1 to: 4 do: [ :column | 
		1 to: 4 do: [ :line | 
			self
				assert: ((model selectCellsOfColumn: column) at: line)
				identicalTo: ((model selectCellsOfLine: line) at: column) ] ]
]

{ #category : 'tests-accessing-entities' }
CMModelTest >> testSelectCellsOfLine [

	1 to: 4 do: [ :line | 
		| cells |
		cells := model selectCellsOfLine: line.
		self assert: cells size equals: 4.
		cells do: [ :cell | self assert: cell rowNumber equals: line ] ]
]

{ #category : 'tests' }
CMModelTest >> testShortestDistanceToCellsVerifying [
	| m |
	m := CMMockModel new.
	(m allTheEntities: CMMockCell)
		do: [ :cell | 
			self assert: (cell shortestDistanceToCellsVerifying: [ :c | c state = #dead | (c state = #alive) ])
				equals: 1 ]
]

{ #category : 'tests-accessing-entities' }
CMModelTest >> testUpperLeftCell [
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
CMModelTest >> testUpperRightCell [
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
