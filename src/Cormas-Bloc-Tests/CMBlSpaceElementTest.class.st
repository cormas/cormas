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
CMBlSpaceElementTest >> aggregateOf: someCells pov: aPointOfView [

	^ (model createAggregate: CMMockAggregate from: someCells)
		  pov: aPointOfView;
		  yourself
]

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

{ #category : 'private' }
CMBlSpaceElementTest >> roadFrom: anEntity to: anotherEntity color: aColor [
	"A road thick enough to look at, 8 pixels wide"

	^ (model newEntity: CMMockRoad from: anEntity to: anotherEntity)
		  pov: (CMPointOfView color: aColor size: 0.25);
		  yourself
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

{ #category : 'tests - links' }
CMBlSpaceElementTest >> testAgentIsDrawnOnTopOfItsLink [

	| element |
	self gridWithNeighbourhood: 4.
	self
		roadFrom: (self newCowOn: (model cellAt: 2 at: 2))
		to: (model cellAt: 2 at: 3)
		color: Color blue.

	element := CMBlSpaceElement for: model.

	self assert: (self hexColorIn: element at: 48 @ 48) equals: 'FF0000'.
	self assert: (self hexColorIn: element at: 55 @ 48) equals: '0000FF'
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
CMBlSpaceElementTest >> testAgentsStayOnTopOfAggregates [

	| element |
	self gridWithNeighbourhood: 4.
	self newCowOn: (model cellAt: 2 at: 3).
	self aggregateOf: model cells pov: (CMPointOfView color: Color blue).

	element := CMBlSpaceElement for: model.

	self assert: (self hexColorIn: element at: 80 @ 48) equals: 'FF0000'.
	self assert: (self hexColorIn: element at: 16 @ 16) equals: '0000FF'
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
CMBlSpaceElementTest >> testAggregateCreatedLastIsOnTop [

	| element |
	self gridWithNeighbourhood: 4.
	self aggregateOf: model cells pov: (CMPointOfView color: Color blue).
	self
		aggregateOf: { (model cellAt: 2 at: 2) }
		pov: (CMPointOfView color: Color green).

	element := CMBlSpaceElement for: model.

	self
		assert: (self hexColorIn: element at: 48 @ 48)
		equals: Color green asHexString.
	self assert: (self hexColorIn: element at: 16 @ 16) equals: '0000FF'
]

{ #category : 'tests' }
CMBlSpaceElementTest >> testAggregateOfAggregatesIsDrawn [

	| inner element |
	self gridWithNeighbourhood: 4.
	inner := self
		         aggregateOf: { (model cellAt: 2 at: 2) }
		         pov: CMPointOfView new.
	self aggregateOf: { inner } pov: (CMPointOfView color: Color blue).

	element := CMBlSpaceElement for: model.

	self assert: (self hexColorIn: element at: 48 @ 48) equals: '0000FF'
]

{ #category : 'tests' }
CMBlSpaceElementTest >> testAggregateOfAnyClassIsDrawn [

	| element aggregate |
	self gridWithNeighbourhood: 4.
	aggregate := model
		             createAggregate: CMSpatialEntityAggregate
		             from: { (model cellAt: 2 at: 2) }.

	[
		CMSpatialEntityAggregate activePovSelector: #povId.
		element := CMBlSpaceElement for: model.
		self
			assert: (self hexColorIn: element at: 48 @ 48)
			equals: aggregate povId color asHexString ] ensure: [
		CMSpatialEntityAggregate resetActivePovSelector ]
]

{ #category : 'tests' }
CMBlSpaceElementTest >> testAggregateReleasedByAMergeIsNotDrawn [

	| kept merged element |
	self gridWithNeighbourhood: 4.
	kept := self
		        aggregateOf: { (model cellAt: 1 at: 1) }
		        pov: (CMPointOfView color: Color blue).
	merged := self
		          aggregateOf: { (model cellAt: 2 at: 2) }
		          pov: (CMPointOfView color: Color green).
	kept mergeWith: merged.

	element := CMBlSpaceElement for: model.

	self assert: (self hexColorIn: element at: 48 @ 48) equals: '0000FF'
]

{ #category : 'tests' }
CMBlSpaceElementTest >> testAggregateWithDefaultPovDrawsNothing [

	| element |
	self gridWithNeighbourhood: 4.
	model
		createAggregate: CMSpatialEntityAggregate
		from: { (model cellAt: 2 at: 2) }.

	element := CMBlSpaceElement for: model.

	self
		assert: ((self formOf: element) colorAt: 48 @ 48)
		equals: Color black
]

{ #category : 'tests' }
CMBlSpaceElementTest >> testAggregateWithoutAColorShowsItsCells [

	| element form |
	self gridWithNeighbourhood: 4.
	self
		aggregateOf: { (model cellAt: 2 at: 2) }
		pov: (CMPointOfView new
				 borderColor: Color blue;
				 yourself).

	element := CMBlSpaceElement for: model.
	form := self formOf: element.

	self assert: (form colorAt: 48 @ 48) equals: Color black.
	self assert: (form colorAt: 48 @ 32) blue > 0.9
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

{ #category : 'tests - links' }
CMBlSpaceElementTest >> testLinkCreatedLastIsOnTop [

	| element |
	self gridWithNeighbourhood: 4.
	self
		roadFrom: (model cellAt: 2 at: 2)
		to: (model cellAt: 2 at: 3)
		color: Color blue.
	self
		roadFrom: (model cellAt: 2 at: 2)
		to: (model cellAt: 2 at: 3)
		color: Color green.

	element := CMBlSpaceElement for: model.

	self
		assert: (self hexColorIn: element at: 52 @ 48)
		equals: Color green asHexString
]

{ #category : 'tests - links' }
CMBlSpaceElementTest >> testLinkIsDrawnOnTopOfAggregates [

	| element |
	self gridWithNeighbourhood: 4.
	self aggregateOf: model cells pov: (CMPointOfView color: Color green).
	self
		roadFrom: (model cellAt: 2 at: 2)
		to: (model cellAt: 2 at: 3)
		color: Color blue.

	element := CMBlSpaceElement for: model.

	self assert: (self hexColorIn: element at: 52 @ 48) equals: '0000FF'.
	self
		assert: (self hexColorIn: element at: 16 @ 16)
		equals: Color green asHexString
]

{ #category : 'tests - links' }
CMBlSpaceElementTest >> testLinkIsDrawnOnTopOfTheCells [

	| element |
	self gridWithNeighbourhood: 4.
	self
		roadFrom: (model cellAt: 2 at: 2)
		to: (model cellAt: 2 at: 3)
		color: Color blue.

	element := CMBlSpaceElement for: model.

	self assert: (self hexColorIn: element at: 52 @ 48) equals: '0000FF'.
	self assert: (self hexColorIn: element at: 16 @ 16) equals: '000000'
]

{ #category : 'tests - links' }
CMBlSpaceElementTest >> testLinkOfAnyClassIsDrawn [
	"The default line is black, so it needs a white background to be seen"

	| element |
	self gridWithNeighbourhood: 4.
	self aggregateOf: model cells pov: (CMPointOfView color: Color white).
	(model
		 newEntity: CMMockHighway
		 from: (model cellAt: 2 at: 2)
		 to: (model cellAt: 2 at: 3)) pov:
		(CMPointOfView color: Color blue size: 0.25).
	model
		newEntity: CMMockFriendship
		from: (model cellAt: 3 at: 2)
		to: (model cellAt: 3 at: 3).

	element := CMBlSpaceElement for: model.

	self assert: (self hexColorIn: element at: 52 @ 48) equals: '0000FF'.
	self deny: (self hexColorIn: element at: 64 @ 80) equals: 'FFFFFF'.
	self assert: (self hexColorIn: element at: 64 @ 90) equals: 'FFFFFF'
]

{ #category : 'tests - links' }
CMBlSpaceElementTest >> testLinkToADeadAggregateIsDrawnUntilItIsRemoved [

	| aggregate element |
	self gridWithNeighbourhood: 4.
	aggregate := model
		             createAggregate: CMMockAggregate
		             from: { (model cellAt: 2 at: 2) }.
	self
		roadFrom: aggregate
		to: (model cellAt: 2 at: 3)
		color: Color blue.
	aggregate isDead: true.

	element := CMBlSpaceElement for: model.
	self assert: (self hexColorIn: element at: 52 @ 48) equals: '0000FF'.

	model removeDestroyedEntities.
	element update.
	self assert: (self hexColorIn: element at: 52 @ 48) equals: '000000'
]

{ #category : 'tests - links' }
CMBlSpaceElementTest >> testLinkToAnInvisibleEntityIsDrawn [

	| goat element |
	self gridWithNeighbourhood: 4.
	goat := model
		        newEntity: CMMockGoat
		        locatedAt: (model cellAt: 2 at: 2).
	self roadFrom: goat to: (model cellAt: 2 at: 3) color: Color blue.
	CMMockGoat activePovSelector: #povInvisible.

	[
		element := CMBlSpaceElement for: model.
		self assert: (self hexColorIn: element at: 48 @ 48) equals: '0000FF' ]
		ensure: [ CMMockGoat resetActivePovSelector ]
]

{ #category : 'tests - links' }
CMBlSpaceElementTest >> testLinkWithAnEndOffTheGridIsNotDrawn [

	| element |
	self gridWithNeighbourhood: 4.
	self
		roadFrom: (model newEntity: CMMockCow)
		to: (model cellAt: 2 at: 2)
		color: Color blue.

	element := CMBlSpaceElement for: model.

	self assert: (self hexColorIn: element at: 48 @ 48) equals: '000000'
]

{ #category : 'tests' }
CMBlSpaceElementTest >> testOpaqueAggregateHidesItsCells [

	| element |
	self gridWithNeighbourhood: 4.
	self
		aggregateOf: { (model cellAt: 2 at: 2) }
		pov: (CMPointOfView color: Color blue).

	element := CMBlSpaceElement for: model.

	self assert: (self hexColorIn: element at: 48 @ 48) equals: '0000FF'.
	self assert: (self hexColorIn: element at: 16 @ 16) equals: '000000'
]

{ #category : 'tests' }
CMBlSpaceElementTest >> testTranslucentAggregateTintsItsCells [
	"Half blue over the black of a dead cell"

	| element blue |
	self gridWithNeighbourhood: 4.
	self
		aggregateOf: { (model cellAt: 2 at: 2) }
		pov: (CMPointOfView color: (Color blue alpha: 0.5)).

	element := CMBlSpaceElement for: model.
	blue := ((self formOf: element) colorAt: 48 @ 48) blue.

	self assert: (blue closeTo: 0.5 precision: 0.02)
]

{ #category : 'tests - links' }
CMBlSpaceElementTest >> testUpdateDoesNotDrawALinkTwice [
	"A second copy of a translucent line would make it stronger"

	| element blue |
	self gridWithNeighbourhood: 4.
	self
		roadFrom: (model cellAt: 2 at: 2)
		to: (model cellAt: 2 at: 3)
		color: (Color blue alpha: 0.5).
	element := CMBlSpaceElement for: model.

	element update.
	blue := ((self formOf: element) colorAt: 52 @ 48) blue.

	self assert: (blue closeTo: 0.5 precision: 0.02)
]

{ #category : 'tests' }
CMBlSpaceElementTest >> testUpdateDoesNotDrawAnAggregateTwice [
	"A second copy of a translucent shape would make it stronger"

	| element blue |
	self gridWithNeighbourhood: 4.
	self
		aggregateOf: { (model cellAt: 2 at: 2) }
		pov: (CMPointOfView color: (Color blue alpha: 0.5)).
	element := CMBlSpaceElement for: model.

	element update.
	blue := ((self formOf: element) colorAt: 48 @ 48) blue.

	self assert: (blue closeTo: 0.5 precision: 0.02)
]

{ #category : 'tests - links' }
CMBlSpaceElementTest >> testUpdateFollowsAChangeOfPovOfALink [

	| road element |
	self gridWithNeighbourhood: 4.
	road := self
		        roadFrom: (model cellAt: 2 at: 2)
		        to: (model cellAt: 2 at: 3)
		        color: Color blue.
	element := CMBlSpaceElement for: model.

	road pov: (CMPointOfView color: Color green size: 0.25).
	element update.

	self
		assert: (self hexColorIn: element at: 52 @ 48)
		equals: Color green asHexString
]

{ #category : 'tests' }
CMBlSpaceElementTest >> testUpdateFollowsAMerge [

	| kept merged element |
	self gridWithNeighbourhood: 4.
	kept := self
		        aggregateOf: { (model cellAt: 1 at: 1) }
		        pov: (CMPointOfView color: Color blue).
	merged := self
		          aggregateOf: { (model cellAt: 2 at: 2) }
		          pov: (CMPointOfView color: Color green).
	element := CMBlSpaceElement for: model.

	kept mergeWith: merged.
	element update.

	self assert: (self hexColorIn: element at: 48 @ 48) equals: '0000FF'
]

{ #category : 'tests - links' }
CMBlSpaceElementTest >> testUpdateFollowsAMovingAgent [

	| cow element |
	self gridWithNeighbourhood: 4.
	cow := self newCowOn: (model cellAt: 2 at: 2).
	self roadFrom: cow to: (model cellAt: 2 at: 4) color: Color blue.
	element := CMBlSpaceElement for: model.
	self assert: (self hexColorIn: element at: 55 @ 48) equals: '0000FF'.

	cow moveTo: (model cellAt: 2 at: 3).
	element update.

	self assert: (self hexColorIn: element at: 55 @ 48) equals: '000000'.
	self assert: (self hexColorIn: element at: 87 @ 48) equals: '0000FF'
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

{ #category : 'tests - links' }
CMBlSpaceElementTest >> testUpdateFollowsAnEndLeavingAndComingBackToTheGrid [

	| cow cell element |
	self gridWithNeighbourhood: 4.
	cell := model cellAt: 2 at: 2.
	cow := self newCowOn: cell.
	self roadFrom: cow to: (model cellAt: 2 at: 3) color: Color blue.
	element := CMBlSpaceElement for: model.

	cow leave.
	element update.
	self assert: (self hexColorIn: element at: 55 @ 48) equals: '000000'.

	cow moveTo: cell.
	element update.
	self assert: (self hexColorIn: element at: 55 @ 48) equals: '0000FF'
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
CMBlSpaceElementTest >> testUpdateFollowsTheActivePovOfAnAggregate [

	| element |
	self gridWithNeighbourhood: 4.
	self
		aggregateOf: { (model cellAt: 2 at: 2) }
		pov: (CMPointOfView color: Color blue).
	element := CMBlSpaceElement for: model.

	[
		CMMockAggregate activePovSelector: #povInvisible.
		element update.

		self
			assert: ((self formOf: element) colorAt: 48 @ 48)
			equals: Color black ] ensure: [
		CMMockAggregate resetActivePovSelector ]
]

{ #category : 'tests' }
CMBlSpaceElementTest >> testUpdateKeepsAgentsOnTopOfAggregates [

	| element |
	self gridWithNeighbourhood: 4.
	self newCowOn: (model cellAt: 2 at: 3).
	self aggregateOf: model cells pov: (CMPointOfView color: Color blue).
	element := CMBlSpaceElement for: model.

	element update.

	self assert: (self hexColorIn: element at: 80 @ 48) equals: 'FF0000'
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

{ #category : 'tests - links' }
CMBlSpaceElementTest >> testUpdateRemovesDeletedLink [

	| road element |
	self gridWithNeighbourhood: 4.
	road := self
		        roadFrom: (model cellAt: 2 at: 2)
		        to: (model cellAt: 2 at: 3)
		        color: Color blue.
	element := CMBlSpaceElement for: model.

	road delete.
	element update.

	self assert: (self hexColorIn: element at: 52 @ 48) equals: '000000'
]

{ #category : 'tests' }
CMBlSpaceElementTest >> testUpdateRemovesReleasedAggregates [

	| element |
	self gridWithNeighbourhood: 4.
	self
		aggregateOf: { (model cellAt: 2 at: 2) }
		pov: (CMPointOfView color: Color blue).
	element := CMBlSpaceElement for: model.

	model releaseAggregateType: CMMockAggregate.
	element update.

	self
		assert: ((self formOf: element) colorAt: 48 @ 48)
		equals: Color black
]

{ #category : 'tests' }
CMBlSpaceElementTest >> testUpdateShowsAggregateThatGrew [

	| aggregate element |
	self gridWithNeighbourhood: 4.
	aggregate := self
		             aggregateOf: { (model cellAt: 1 at: 1) }
		             pov: (CMPointOfView color: Color blue).
	element := CMBlSpaceElement for: model.

	aggregate addComponent: (model cellAt: 2 at: 2).
	element update.

	self assert: (self hexColorIn: element at: 48 @ 48) equals: '0000FF'
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
CMBlSpaceElementTest >> testUpdateShowsNewAggregate [

	| element |
	self gridWithNeighbourhood: 4.
	element := CMBlSpaceElement for: model.

	self
		aggregateOf: { (model cellAt: 2 at: 2) }
		pov: (CMPointOfView color: Color blue).
	element update.

	self assert: (self hexColorIn: element at: 48 @ 48) equals: '0000FF'
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

{ #category : 'tests - links' }
CMBlSpaceElementTest >> testUpdateShowsNewLink [

	| element |
	self gridWithNeighbourhood: 4.
	element := CMBlSpaceElement for: model.

	self
		roadFrom: (model cellAt: 2 at: 2)
		to: (model cellAt: 2 at: 3)
		color: Color blue.
	element update.

	self assert: (self hexColorIn: element at: 52 @ 48) equals: '0000FF'
]

{ #category : 'tests' }
CMBlSpaceElementTest >> testUpdateShowsNewPovOfAnAggregate [

	| aggregate element |
	self gridWithNeighbourhood: 4.
	aggregate := self
		             aggregateOf: { (model cellAt: 2 at: 2) }
		             pov: (CMPointOfView color: Color blue).
	element := CMBlSpaceElement for: model.

	aggregate pov: (CMPointOfView color: Color green).
	element update.

	self
		assert: (self hexColorIn: element at: 48 @ 48)
		equals: Color green asHexString
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
			assert: (element aeAsForm colorAt:
					 (element localPointToGlobal: 80 @ 48) rounded) asHexString
			equals: 'FFFFFF' ] ensure: [
			space
				close;
				settle ]
]
