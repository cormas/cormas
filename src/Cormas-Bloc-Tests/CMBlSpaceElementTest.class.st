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
	#name : 'CMBlSpaceElementTest',
	#superclass : 'CMBlTestCase',
	#category : 'Cormas-Bloc-Tests',
	#package : 'Cormas-Bloc-Tests'
}

{ #category : 'private' }
CMBlSpaceElementTest >> assertCell2x3OfGrid: aNeighbourhood hasCenter: aCenter andCell2x2HasCenter: anotherCenter [
	"Paint only cell (row 2, column 3) white, and check where it appears on screen"

	| element |
	self gridWithNeighbourhood: aNeighbourhood.
	(model cellAt: 2 at: 3) initAlive.

	element := CMBlSpaceElement for: model.

	self assert: (self hexColorIn: element at: aCenter) equals: 'FFFFFF'.
	self
		assert: (self hexColorIn: element at: anotherCenter)
		equals: '000000'
]

{ #category : 'tests' }
CMBlSpaceElementTest >> testAgentAppearsAtItsPositionInTheCell [

	| element |
	self gridWithNeighbourhood: 4.
	(self newCowOn: (model cellAt: 2 at: 3)) positionInCell: 0.25 @ 0.75.

	element := CMBlSpaceElement for: model.

	self assert: (self hexColorIn: element at: 72 @ 56) equals: 'FF0000'.
	self assert: (self hexColorIn: element at: 80 @ 48) equals: '000000'
]

{ #category : 'tests' }
CMBlSpaceElementTest >> testAgentsAppearOnTheirCell [

	self gridWithNeighbourhood: 4.
	self newCowOn: (model cellAt: 2 at: 3).

	self
		assert: (self hexColorIn: (CMBlSpaceElement for: model) at: 80 @ 48)
		equals: 'FF0000'
]

{ #category : 'tests' }
CMBlSpaceElementTest >> testAgentsAppearOnTheirCellInGridOfFlatTopHexagons [

	self gridWithNeighbourhood: #flat6.
	self newCowOn: (model cellAt: 2 at: 3).

	self
		assert:
		(self hexColorIn: (CMBlSpaceElement for: model) at: 64 @ 41.6)
		equals: 'FF0000'
]

{ #category : 'tests' }
CMBlSpaceElementTest >> testAgentsAppearOnTheirCellInGridOfTriangles [
	"Cell (2, 3) is an upside-down triangle, so its center is in the upper part of its box"

	self gridWithNeighbourhood: 3.
	self newCowOn: (model cellAt: 2 at: 3).

	self
		assert: (self hexColorIn: (CMBlSpaceElement for: model) at: 48 @ 41)
		equals: 'FF0000'
]

{ #category : 'tests' }
CMBlSpaceElementTest >> testAgentsWithoutACellAreNotShown [

	| element |
	self gridWithNeighbourhood: 4.
	model newEntity: CMMockCow.

	element := CMBlSpaceElement for: model.

	self assert: (self hexColorIn: element at: 16 @ 16) equals: '000000'
]

{ #category : 'tests' }
CMBlSpaceElementTest >> testCellPositionsInGridOf4Neighbours [

	self
		assertCell2x3OfGrid: 4
		hasCenter: 80 @ 48
		andCell2x2HasCenter: 48 @ 48
]

{ #category : 'tests' }
CMBlSpaceElementTest >> testCellPositionsInGridOf8Neighbours [

	self
		assertCell2x3OfGrid: 8
		hasCenter: 80 @ 48
		andCell2x2HasCenter: 48 @ 48
]

{ #category : 'tests' }
CMBlSpaceElementTest >> testCellPositionsInGridOfFlatTopHexagons [
	"Columns overlap by a quarter of a cell, and the second column is shifted down by half a cell"

	self
		assertCell2x3OfGrid: #flat6
		hasCenter: 64 @ 41.6
		andCell2x2HasCenter: 40 @ 55.4
]

{ #category : 'tests' }
CMBlSpaceElementTest >> testCellPositionsInGridOfPointyTopHexagons [
	"Rows overlap by a quarter of a cell, and the second row is shifted right by half a cell"

	self
		assertCell2x3OfGrid: #pointy6
		hasCenter: 83.1 @ 40
		andCell2x2HasCenter: 55.4 @ 40
]

{ #category : 'tests' }
CMBlSpaceElementTest >> testCellPositionsInGridOfTriangles [
	"Each triangle starts half a cell after the previous one in its row"

	self
		assertCell2x3OfGrid: 3
		hasCenter: 48 @ 48
		andCell2x2HasCenter: 32 @ 52
]

{ #category : 'tests' }
CMBlSpaceElementTest >> testExtentFitsTheGrid [

	self gridWithNeighbourhood: 4.

	self
		assert: (self formOf: (CMBlSpaceElement for: model)) extent
		equals: 128 @ 96
]

{ #category : 'tests' }
CMBlSpaceElementTest >> testUpdateFollowsANewGrid [

	| element |
	self gridWithNeighbourhood: 4.
	element := CMBlSpaceElement for: model.

	model
		createGridNumberOfRows: 1
		numberOfColumns: 2
		neighbourhood: 4
		closed: true.
	model cells do: #initAlive.
	element update.

	self assert: (self formOf: element) extent equals: 64 @ 32.
	self assert: (self hexColorIn: element at: 48 @ 16) equals: 'FFFFFF'
]

{ #category : 'tests' }
CMBlSpaceElementTest >> testUpdateFollowsTheActivePov [

	| element |
	self gridWithNeighbourhood: 4.
	element := CMBlSpaceElement for: model.

	[
		CMMockCell activePovSelector: #povInvisible.
		element update.

		self assert: (self isTransparentIn: element at: 80 @ 48) ] ensure: [
		CMMockCell resetActivePovSelector ]
]

{ #category : 'tests' }
CMBlSpaceElementTest >> testUpdateRemovesDeadAgent [

	| element cow |
	self gridWithNeighbourhood: 4.
	cow := self newCowOn: (model cellAt: 2 at: 3).
	element := CMBlSpaceElement for: model.

	cow delete.
	element update.

	self assert: (self hexColorIn: element at: 80 @ 48) equals: '000000'
]

{ #category : 'tests' }
CMBlSpaceElementTest >> testUpdateShowsMovedAgent [

	| element cow |
	self gridWithNeighbourhood: 4.
	cow := self newCowOn: (model cellAt: 1 at: 1).
	element := CMBlSpaceElement for: model.

	cow moveTo: (model cellAt: 2 at: 3).
	element update.

	self assert: (self hexColorIn: element at: 16 @ 16) equals: '000000'.
	self assert: (self hexColorIn: element at: 80 @ 48) equals: 'FF0000'
]

{ #category : 'tests' }
CMBlSpaceElementTest >> testUpdateShowsNewAgent [

	| element |
	self gridWithNeighbourhood: 4.
	element := CMBlSpaceElement for: model.

	self newCowOn: (model cellAt: 2 at: 3).
	element update.

	self assert: (self hexColorIn: element at: 80 @ 48) equals: 'FF0000'
]

{ #category : 'tests' }
CMBlSpaceElementTest >> testUpdateShowsNewCellState [

	| element |
	self gridWithNeighbourhood: 4.
	element := CMBlSpaceElement for: model.

	(model cellAt: 2 at: 3) initAlive.
	element update.

	self assert: (self hexColorIn: element at: 80 @ 48) equals: 'FFFFFF'
]

{ #category : 'tests' }
CMBlSpaceElementTest >> testUpdateWhileAttachedToASpaceRunsInThatSpace [
	"Elements in a space may only change from the process of that space. A simulation calls update from another process"

	| element space |
	self gridWithNeighbourhood: 4.
	element := CMBlSpaceElement for: model.
	space := BlSpace new
		         host: BlHeadlessHost default;
		         yourself.
	space root addChild: element.
	[
		space
			show;
			settle.
		(model cellAt: 2 at: 3) initAlive.

		element update.
		space settle.

		self
			assert: (element aeAsForm colorAt: 80 @ 48) asHexString
			equals: 'FFFFFF' ] ensure: [
			space
				close;
				settle ]
]
