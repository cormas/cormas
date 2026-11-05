"
I check how an agent walks in a straight line with `moveStraight:towards:` and knows it has arrived with `isAtCenterOf:`.

## Responsibility:

- Check that an agent moves by any fraction of a cell, stays on the line and stops exactly at the center of its target.
- Check that the agent changes cell only when it crosses into another one.
- Check that a line takes the shortest way across the edges of a torus, and on every shape of cell.

## Collaborators:

- `CMMockCow`: the agent that walks.
- `CMMockModel`: holds the grid.

## Public API and Key Messages

- Run me as any test case.
"
Class {
	#name : 'CMStraightMoveTest',
	#superclass : 'TestCase',
	#category : 'Cormas-Tests',
	#package : 'Cormas-Tests'
}

{ #category : 'private' }
CMStraightMoveTest >> assertPosition: aCow equals: aPoint [

	self assert:
		(aCow positionInCell x closeTo: aPoint x precision: 0.000001).
	self assert:
		(aCow positionInCell y closeTo: aPoint y precision: 0.000001)
]

{ #category : 'private' }
CMStraightMoveTest >> assertWalkFrom: startCell to: targetCell [
	"The agent reaches the target, always on the straight line drawn between the centers, and about inside the box of the cell it is in. The center closest to a position near the edge of a triangle can be that of the next triangle, hence the margin"

	| cow grid start way steps |
	cow := self cowAtCenterOf: startCell.
	grid := startCell spaceModel neighbourhoodConfiguration.
	start := grid gridPositionOf: startCell at: cow positionInCell.
	way := grid wayFrom: start to: (grid centerOnGridOf: targetCell).
	steps := 0.
	[ cow isAtCenterOf: targetCell ] whileFalse: [
			| offset |
			cow moveStraight: 0.3 towards: targetCell.
			offset := grid
				          wayFrom: start
				          to:
				          (grid gridPositionOf: cow cell at: cow positionInCell).
			self assert: (offset x * way y - (offset y * way x)) abs < 0.000001.
			self assert: cow positionInCell x >= -0.1.
			self assert: cow positionInCell y >= -0.1.
			self assert: cow positionInCell x <= 1.1.
			self assert: cow positionInCell y <= 1.1.
			steps := steps + 1.
			self assert: steps <= (way r / 0.3) ceiling ].
	self assert: cow cell equals: targetCell
]

{ #category : 'private' }
CMStraightMoveTest >> cowAtCenterOf: aCell [

	| cow |
	cow := aCell cormasModel newEntity: CMMockCow.
	cow moveTo: aCell.
	cow positionInCell:
		(aCell spaceModel neighbourhoodConfiguration cellCenterFor: aCell).
	^ cow
]

{ #category : 'private' }
CMStraightMoveTest >> modelOfRows: rows columns: columns neighbourhood: aNumber closed: aBoolean [

	^ CMMockModel new
		  createGridNumberOfRows: rows
		  numberOfColumns: columns
		  neighbourhood: aNumber
		  closed: aBoolean;
		  yourself
]

{ #category : 'tests' }
CMStraightMoveTest >> testAClosedGridNeverWraps [

	| model target cow |
	model := self
		         modelOfRows: 5
		         columns: 5
		         neighbourhood: 4
		         closed: true.
	target := model cellAt: 3 at: 5.
	cow := self cowAtCenterOf: (model cellAt: 3 at: 1).

	cow moveStraight: 0.75 towards: target.

	self assert: cow cell equals: (model cellAt: 3 at: 2).
	self assertPosition: cow equals: 0.25 @ 0.5
]

{ #category : 'tests' }
CMStraightMoveTest >> testACowAlmostAtTheCenterIsAtIt [

	| model cell cow |
	model := self
		         modelOfRows: 1
		         columns: 1
		         neighbourhood: 4
		         closed: true.
	cell := model cellAt: 1 at: 1.
	cow := self cowAtCenterOf: cell.

	cow positionInCell: 0.5 + 1.0e-10 @ 0.5.

	self assert: (cow isAtCenterOf: cell)
]

{ #category : 'tests' }
CMStraightMoveTest >> testALongMoveLandsInTheRightCell [

	| model cow |
	model := self
		         modelOfRows: 50
		         columns: 50
		         neighbourhood: 4
		         closed: true.
	cow := self cowAtCenterOf: (model cellAt: 1 at: 25).

	cow moveStraight: 30 towards: (model cellAt: 50 at: 25).

	self assert: cow cell equals: (model cellAt: 31 at: 25)
]

{ #category : 'tests' }
CMStraightMoveTest >> testATargetHalfwayRoundATorusIsReachedDirectly [

	| model target cow |
	model := self
		         modelOfRows: 1
		         columns: 2
		         neighbourhood: 4
		         closed: false.
	target := model cellAt: 1 at: 2.
	cow := self cowAtCenterOf: (model cellAt: 1 at: 1).

	cow moveStraight: 0.25 towards: target.

	self assertPosition: cow equals: 0.75 @ 0.5
]

{ #category : 'tests' }
CMStraightMoveTest >> testATorusTakesTheShorterWayAcrossItsEdge [

	| model target cow |
	model := self
		         modelOfRows: 5
		         columns: 5
		         neighbourhood: 4
		         closed: false.
	target := model cellAt: 3 at: 5.
	cow := self cowAtCenterOf: (model cellAt: 3 at: 1).

	cow moveStraight: 0.25 towards: target.
	self assert: cow cell equals: (model cellAt: 3 at: 1).
	self assertPosition: cow equals: 0.25 @ 0.5.

	cow moveStraight: 0.5 towards: target.
	self assert: cow cell equals: target.
	self assertPosition: cow equals: 0.75 @ 0.5.

	cow moveStraight: 0.25 towards: target.
	self assert: (cow isAtCenterOf: target)
]

{ #category : 'tests' }
CMStraightMoveTest >> testATorusWrapsAcrossBothEdgesAtOnce [

	| model target cow |
	model := self
		         modelOfRows: 5
		         columns: 5
		         neighbourhood: 8
		         closed: false.
	target := model cellAt: 5 at: 5.
	cow := self cowAtCenterOf: (model cellAt: 1 at: 1).

	cow moveStraight: 2 sqrt * 0.75 towards: target.

	self assert: cow cell equals: target.
	self assertPosition: cow equals: 0.75 @ 0.75
]

{ #category : 'tests' }
CMStraightMoveTest >> testAnAgentOffTheGridCannotMove [

	| model cow |
	model := self
		         modelOfRows: 1
		         columns: 1
		         neighbourhood: 4
		         closed: true.
	cow := model newEntity: CMMockCow.

	self
		should: [ cow moveStraight: 1 towards: (model cellAt: 1 at: 1) ]
		raise: Error
		withExceptionDo: [ :error |
		self deny: (error isKindOf: MessageNotUnderstood) ]
]

{ #category : 'tests' }
CMStraightMoveTest >> testChangesCellOnlyWhenItCrossesIntoTheNextOne [

	| model start target cow |
	model := self
		         modelOfRows: 2
		         columns: 2
		         neighbourhood: 8
		         closed: true.
	start := model cellAt: 1 at: 1.
	target := model cellAt: 2 at: 2.
	cow := self cowAtCenterOf: start.

	cow moveStraight: 2 sqrt / 10 towards: target.
	self assert: cow cell equals: start.
	self assertPosition: cow equals: 0.6 @ 0.6.

	5 timesRepeat: [ cow moveStraight: 2 sqrt / 10 towards: target ].
	self assert: cow cell equals: target.
	self assertPosition: cow equals: 0.1 @ 0.1.
	self assert: (target allOccupants includes: cow).
	self deny: (start allOccupants includes: cow)
]

{ #category : 'tests' }
CMStraightMoveTest >> testIsNotAtTheCenterAwayFromItOrInAnotherCell [

	| model cell other cow |
	model := self
		         modelOfRows: 1
		         columns: 2
		         neighbourhood: 4
		         closed: true.
	cell := model cellAt: 1 at: 1.
	other := model cellAt: 1 at: 2.
	cow := self cowAtCenterOf: cell.

	self deny: (cow isAtCenterOf: other).
	cow positionInCell: 0.6 @ 0.5.
	self deny: (cow isAtCenterOf: cell)
]

{ #category : 'tests' }
CMStraightMoveTest >> testManySmallStepsArriveExactlyDespiteRounding [

	| model target cow |
	model := self
		         modelOfRows: 1
		         columns: 2
		         neighbourhood: 4
		         closed: true.
	target := model cellAt: 1 at: 2.
	cow := self cowAtCenterOf: (model cellAt: 1 at: 1).

	999 timesRepeat: [ cow moveStraight: 0.001 towards: target ].
	self deny: (cow isAtCenterOf: target).
	cow moveStraight: 0.001 towards: target.

	self assert: (cow isAtCenterOf: target).
	self assert: cow positionInCell equals: 0.5 @ 0.5
]

{ #category : 'tests' }
CMStraightMoveTest >> testMovesByAFractionOfACell [

	| model start cow |
	model := self
		         modelOfRows: 1
		         columns: 2
		         neighbourhood: 4
		         closed: true.
	start := model cellAt: 1 at: 1.
	cow := self cowAtCenterOf: start.

	cow moveStraight: 0.1 towards: (model cellAt: 1 at: 2).

	self assert: cow cell equals: start.
	self assertPosition: cow equals: 0.6 @ 0.5
]

{ #category : 'tests' }
CMStraightMoveTest >> testMovingTowardsItsOwnCellGoesToItsCenter [

	| model cell cow |
	model := self
		         modelOfRows: 1
		         columns: 1
		         neighbourhood: 4
		         closed: true.
	cell := model cellAt: 1 at: 1.
	cow := self cowAtCenterOf: cell.
	cow positionInCell: 0.1 @ 0.5.

	cow moveStraight: 0.1 towards: cell.
	self assertPosition: cow equals: 0.2 @ 0.5.

	cow moveStraight: 1 towards: cell.
	self assert: (cow isAtCenterOf: cell)
]

{ #category : 'tests' }
CMStraightMoveTest >> testNeverGoesBeyondTheCenterOfTheTarget [

	| model target cow |
	model := self
		         modelOfRows: 3
		         columns: 3
		         neighbourhood: 8
		         closed: true.
	target := model cellAt: 2 at: 2.
	cow := self cowAtCenterOf: (model cellAt: 1 at: 1).

	cow moveStraight: 100 towards: target.

	self assert: cow cell equals: target.
	self assert: cow positionInCell equals: 0.5 @ 0.5
]

{ #category : 'tests' }
CMStraightMoveTest >> testTenStepsAcrossADiagonalArriveOnTheTenth [

	| model target cow |
	model := self
		         modelOfRows: 2
		         columns: 2
		         neighbourhood: 8
		         closed: true.
	target := model cellAt: 2 at: 2.
	cow := self cowAtCenterOf: (model cellAt: 1 at: 1).

	9 timesRepeat: [
			cow moveStraight: 2 sqrt / 10 towards: target.
			self deny: (cow isAtCenterOf: target) ].
	cow moveStraight: 2 sqrt / 10 towards: target.

	self assert: (cow isAtCenterOf: target).
	self assert: cow cell equals: target.
	self assert: cow positionInCell equals: 0.5 @ 0.5
]

{ #category : 'tests' }
CMStraightMoveTest >> testWalksStraightOnEveryShapeOfCell [

	#( 3 4 6 8 ) do: [ :neighbourhood |
			{ true. false } do: [ :closed |
					| model |
					model := self
						         modelOfRows: 6
						         columns: 6
						         neighbourhood: neighbourhood
						         closed: closed.
					self
						assertWalkFrom: (model cellAt: 1 at: 1)
						to: (model cellAt: 3 at: 3).
					self
						assertWalkFrom: (model cellAt: 2 at: 5)
						to: (model cellAt: 4 at: 2).
					self
						assertWalkFrom: (model cellAt: 1 at: 1)
						to: (model cellAt: 6 at: 6) ] ]
]
