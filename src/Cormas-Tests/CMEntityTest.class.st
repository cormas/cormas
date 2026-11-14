"
A CormasEntityTest is a test class for testing the behavior of CormasEntity
"
Class {
	#name : 'CMEntityTest',
	#superclass : 'TestCase',
	#category : 'Cormas-Tests-Model',
	#package : 'Cormas-Tests',
	#tag : 'Model'
}

{ #category : 'tests - grid' }
CMEntityTest >> newModelWithGrid [

	^ CMMockModel new
		  createGridNumberOfRows: 3
		  numberOfColumns: 3
		  neighbourhood: 4
		  closed: true;
		  yourself
]

{ #category : 'tests - grid' }
CMEntityTest >> testAgentFlaggedDeadIsNotOnGrid [

	| model cow |
	model := self newModelWithGrid.
	cow := model newEntity: CMMockCow locatedAt: (model cellAt: 2 at: 2).

	cow isDead: true.

	self deny: cow isOnGrid
]

{ #category : 'tests - grid' }
CMEntityTest >> testAgentIsOnGridOnlyWhileItHasACell [

	| model cow |
	model := self newModelWithGrid.
	cow := model newEntity: CMMockCow.
	self deny: cow isOnGrid.

	cow moveTo: (model cellAt: 2 at: 2).
	self assert: cow isOnGrid.

	cow leave.
	self deny: cow isOnGrid
]

{ #category : 'tests - grid' }
CMEntityTest >> testAggregateIsOnGridOnlyWhenItHasCells [

	| model aggregate |
	model := self newModelWithGrid.
	aggregate := model newEntity: CMMockAggregate.
	self deny: aggregate isOnGrid.

	aggregate addComponents:
		{ (model cellAt: 2 at: 2) } asOrderedCollection.
	self assert: aggregate isOnGrid
]

{ #category : 'tests - grid' }
CMEntityTest >> testAggregateOfAggregatesIsOnGridOnlyWhenItReachesCells [

	| model inner outer |
	model := self newModelWithGrid.
	inner := model newEntity: CMMockAggregate.
	outer := model createAggregate: CMMockAggregate from: { inner }.
	self deny: outer isOnGrid.

	inner addComponents: { (model cellAt: 2 at: 2) } asOrderedCollection.
	self assert: outer isOnGrid
]

{ #category : 'tests - grid' }
CMEntityTest >> testCellIsOnGridOnlyWhenItBelongsToAGrid [

	| model |
	model := self newModelWithGrid.

	self assert: (model cellAt: 2 at: 2) isOnGrid.
	self deny: (model newEntity: CMMockCell) isOnGrid
]

{ #category : 'tests' }
CMEntityTest >> testCormasEntityIsAbstract [
	self assert: CMEntity isAbstract
]

{ #category : 'tests - grid' }
CMEntityTest >> testEntityWithoutLocationIsNotOnGrid [

	self deny: CMEntity basicNew isOnGrid
]
