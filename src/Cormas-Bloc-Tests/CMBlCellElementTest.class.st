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

{ #category : 'private' }
CMBlCellElementTest >> blackPixelsIn: anElement alongRow: y [
	"Answer how many pixels of the row y of anElement are black"

	| form |
	form := self formOf: anElement.
	^ (0 to: form width - 1) count: [ :x |
		  (form colorAt: x @ y) = Color black ]
]

{ #category : 'tests' }
CMBlCellElementTest >> testBorderIsAtLeastOnePixelWide [
	"A border thinner than a pixel on the screen is shown one pixel wide"

	| element |
	element := self twoNeighbourCellsWithBorderWidth: 0.5 scaledBy: 0.5.
	self assert: (self blackPixelsIn: element alongRow: 12) equals: 3
]

{ #category : 'tests' }
CMBlCellElementTest >> testBorderIsProportionalToCellSize [
	"The default border thickness of the look of a cell is 0.01 of the size of a cell"

	| element |
	self gridWithNeighbourhood: 4.
	element := CMBlCellElement for: (model cellAt: 1 at: 1).
	self assert: element border width closeTo: 0.32.
	self assert: element border paint color equals: Color veryLightGray
]

{ #category : 'tests' }
CMBlCellElementTest >> testBordersHaveTheSameWidthWhereverCellsMeetPixels [
	"Zoomed so that cell edges fall in the middle of pixels, a border 1.6 pixels wide on the screen is 2 pixels wide on every edge"

	| element |
	element := self
		           twoNeighbourCellsWithBorderWidth: 16 / 7
		           scaledBy: 0.7.
	self assert: (self blackPixelsIn: element alongRow: 15) equals: 3 * 2
]

{ #category : 'tests' }
CMBlCellElementTest >> testCellsOfTheSameColorMeetWithoutASeam [
	"Without borders, two cells of the same color look like one continuous area, even when they meet in the middle of a pixel"

	| left right container |
	self gridWithNeighbourhood: 4.
	left := CMBlCellElement for: (model cellAt: 1 at: 1).
	right := CMBlCellElement for: (model cellAt: 1 at: 2).
	left border: BlBorder empty.
	right border: BlBorder empty.
	left position: 10.5 @ 0.
	right position: 42.5 @ 0.
	container := BlElement new
		             extent: 100 @ 40;
		             background: Color white;
		             addChildren: {
				             left.
				             right };
		             yourself.

	self
		assert: (self hexColorIn: container at: 42 @ 10)
		equals: '000000'
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
CMBlCellElementTest >> testNeighbourCellsShareOneBorder [
	"Two cells with borders 3 pixels wide are 3 pixels apart, not 6"

	| element |
	element := self twoNeighbourCellsWithBorderWidth: 3 scaledBy: 1.
	self assert: (self blackPixelsIn: element alongRow: 24) equals: 3 * 3
]

{ #category : 'tests' }
CMBlCellElementTest >> testNoBorderOnCellsTooSmallOnTheScreen [
	"Borders would hide the colors of cells only a few pixels wide on the screen, however thick they are"

	| element |
	element := self twoNeighbourCellsWithBorderWidth: 8 scaledBy: 0.125.
	self assert: (self blackPixelsIn: element alongRow: 3) equals: 0
]

{ #category : 'tests' }
CMBlCellElementTest >> testNoBorderWhenItsThicknessIsZero [
	"A border thickness of zero shows no border at any zoom, even where thin borders are shown one pixel wide"

	| element |
	element := self twoNeighbourCellsWithBorderWidth: 0 scaledBy: 0.5.
	self assert: (self blackPixelsIn: element alongRow: 12) equals: 0
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
CMBlCellElementTest >> testShowsTheColorOfItsLook [

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
				 hexColorIn:
				 (CMBlCellElement
					  withoutOccupantsFor: cell
					  observedBy: CMObserver new)
				 at: 16 @ 16)
		equals: '000000'
]

{ #category : 'private' }
CMBlCellElementTest >> twoNeighbourCellsWithBorderWidth: aNumber scaledBy: aScale [
	"Answer an element showing the first two cells of a row side by side, white with black borders, seen at the given zoom"

	| cells |
	self gridWithNeighbourhood: 4.
	cells := {
		         (model cellAt: 1 at: 1).
		         (model cellAt: 1 at: 2) } collect: [ :each |
		         CMBlCellElement for: each ].
	cells doWithIndex: [ :each :index |
			each
				background: Color white;
				border: (BlBorder paint: Color black width: aNumber);
				position: index - 1 * 32 + 8 @ 8 ].
	^ BlElement new
		  extent: 100 @ 60;
		  background: Color white;
		  addChild: (BlElement new
				   extent: 100 @ 60;
				   clipChildren: false;
				   transformDo: [ :transform |
						   transform
							   topLeftOrigin;
							   scaleBy: aScale ];
				   addChildren: cells;
				   yourself);
		  yourself
]
