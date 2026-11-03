"
I test what the element named after me draws, by reading the pixels of the rendered element.

## Responsibility:

- Check colors, shapes, sizes and positions as they appear on screen.
- Check that `update` shows the changes made to the model.

## Collaborators:

- `CMBlTestCase`: builds the grid and reads the pixels.

## Public API and Key Messages

Expected pixel positions are worked out from the size of a cell, 32 pixels, and the geometry of each grid.
"
Class {
	#name : 'CMBlCellElementTest',
	#superclass : 'CMBlTestCase',
	#category : 'Cormas-Bloc-Tests',
	#package : 'Cormas-Bloc-Tests'
}

{ #category : 'tests' }
CMBlCellElementTest >> testBorderIsProportionalToCellSize [
	"The default border width of a point of view is 0.01 of the size of a cell"

	| element |
	self gridWithNeighbourhood: 4.

	element := CMBlCellElement for: (model cellAt: 1 at: 1).

	self assert: element border width closeTo: 0.32.
	self assert: element border paint color equals: Color veryLightGray
]

{ #category : 'tests' }
CMBlCellElementTest >> testFlatTopHexagon [
	"A flat-top hexagon touches the left and right of its box halfway down, and its corners are empty"

	| element |
	self gridWithNeighbourhood: #flat6.

	element := CMBlCellElement for: (model cellAt: 1 at: 1).

	self assert: (self hexColorIn: element at: 16 @ 14) equals: '000000'.
	self assert: (self hexColorIn: element at: 3 @ 14) equals: '000000'.
	self assert: (self hexColorIn: element at: 16 @ 2) equals: '000000'.
	self assert: (self isTransparentIn: element at: 2 @ 2).
	self assert: (self isTransparentIn: element at: 29 @ 25)
]

{ #category : 'tests' }
CMBlCellElementTest >> testGridOf4NeighboursHasSquareCells [

	| element |
	self gridWithNeighbourhood: 4.

	element := CMBlCellElement for: (model cellAt: 1 at: 1).

	self assert: (self formOf: element) extent equals: 32 @ 32.
	self assert: (self hexColorIn: element at: 3 @ 3) equals: '000000'.
	self assert: (self hexColorIn: element at: 28 @ 28) equals: '000000'
]

{ #category : 'tests' }
CMBlCellElementTest >> testGridOf8NeighboursHasSquareCells [

	| element |
	self gridWithNeighbourhood: 8.

	element := CMBlCellElement for: (model cellAt: 1 at: 1).

	self assert: (self formOf: element) extent equals: 32 @ 32.
	self assert: (self hexColorIn: element at: 3 @ 3) equals: '000000'
]

{ #category : 'tests' }
CMBlCellElementTest >> testPointyTopHexagon [
	"A pointy-top hexagon touches the top and bottom of its box halfway across, and its corners are empty"

	| element |
	self gridWithNeighbourhood: #pointy6.

	element := CMBlCellElement for: (model cellAt: 1 at: 1).

	self assert: (self hexColorIn: element at: 14 @ 16) equals: '000000'.
	self assert: (self hexColorIn: element at: 14 @ 3) equals: '000000'.
	self assert: (self hexColorIn: element at: 2 @ 16) equals: '000000'.
	self assert: (self isTransparentIn: element at: 2 @ 2).
	self assert: (self isTransparentIn: element at: 25 @ 29)
]

{ #category : 'tests' }
CMBlCellElementTest >> testShowsColorOfPov [

	| cell |
	self gridWithNeighbourhood: 4.
	cell := model cellAt: 1 at: 1.

	self
		assert: (self hexColorIn: (CMBlCellElement for: cell) at: 16 @ 16)
		equals: '000000'.

	cell initAlive.

	self
		assert: (self hexColorIn: (CMBlCellElement for: cell) at: 16 @ 16)
		equals: 'FFFFFF'
]

{ #category : 'tests' }
CMBlCellElementTest >> testShowsOccupantAtItsPositionInTheCell [

	| cell element |
	self gridWithNeighbourhood: 4.
	cell := model cellAt: 1 at: 1.
	(self newCowOn: cell) positionInCell: 0.25 @ 0.25.

	element := CMBlCellElement for: cell.

	self assert: (self hexColorIn: element at: 8 @ 8) equals: 'FF0000'.
	self assert: (self hexColorIn: element at: 24 @ 24) equals: '000000'
]

{ #category : 'tests' }
CMBlCellElementTest >> testShowsOccupants [

	| cell |
	self gridWithNeighbourhood: 4.
	cell := model cellAt: 1 at: 1.
	self newCowOn: cell.

	self
		assert: (self hexColorIn: (CMBlCellElement for: cell) at: 16 @ 16)
		equals: 'FF0000'.
	self
		assert: (self hexColorIn: (CMBlCellElement for: cell) at: 4 @ 4)
		equals: '000000'
]

{ #category : 'tests' }
CMBlCellElementTest >> testTriangleOfFirstCellIsUpright [

	| element |
	self gridWithNeighbourhood: 3.

	element := CMBlCellElement for: (model cellAt: 1 at: 1).

	self assert: (self hexColorIn: element at: 16 @ 16) equals: '000000'.
	self assert: (self hexColorIn: element at: 4 @ 28) equals: '000000'.
	self assert: (self isTransparentIn: element at: 3 @ 3).
	self assert: (self isTransparentIn: element at: 28 @ 3)
]

{ #category : 'tests' }
CMBlCellElementTest >> testTriangleOfNextCellIsUpsideDown [

	| element |
	self gridWithNeighbourhood: 3.

	element := CMBlCellElement for: (model cellAt: 1 at: 2).

	self assert: (self hexColorIn: element at: 16 @ 16) equals: '000000'.
	self assert: (self hexColorIn: element at: 4 @ 3) equals: '000000'.
	self assert: (self isTransparentIn: element at: 3 @ 28).
	self assert: (self isTransparentIn: element at: 28 @ 28)
]

{ #category : 'tests' }
CMBlCellElementTest >> testUpdateShowsNewState [

	| cell element |
	self gridWithNeighbourhood: 4.
	cell := model cellAt: 1 at: 1.
	element := CMBlCellElement for: cell.

	cell initAlive.
	element update.

	self assert: (self hexColorIn: element at: 16 @ 16) equals: 'FFFFFF'
]

{ #category : 'tests' }
CMBlCellElementTest >> testUpdateShowsOccupantChanges [

	| cell element cow |
	self gridWithNeighbourhood: 4.
	cell := model cellAt: 1 at: 1.
	cow := self newCowOn: cell.
	element := CMBlCellElement for: cell.

	cow leave.
	element update.
	self assert: (self hexColorIn: element at: 16 @ 16) equals: '000000'.

	cow moveTo: cell.
	element update.
	self assert: (self hexColorIn: element at: 16 @ 16) equals: 'FF0000'
]

{ #category : 'tests' }
CMBlCellElementTest >> testWithoutOccupantsShowsOnlyTheCell [

	| cell |
	self gridWithNeighbourhood: 4.
	cell := model cellAt: 1 at: 1.
	self newCowOn: cell.

	self
		assert: (self
				 hexColorIn: (CMBlCellElement withoutOccupantsFor: cell)
				 at: 16 @ 16)
		equals: '000000'
]
