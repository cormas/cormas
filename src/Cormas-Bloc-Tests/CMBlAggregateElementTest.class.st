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
	#name : 'CMBlAggregateElementTest',
	#superclass : 'CMBlTestCase',
	#category : 'Cormas-Bloc-Tests',
	#package : 'Cormas-Bloc-Tests'
}

{ #category : 'private' }
CMBlAggregateElementTest >> aggregateOf: someCells pov: aPointOfView [

	^ (model createAggregate: CMMockAggregate from: someCells)
		  pov: aPointOfView;
		  yourself
]

{ #category : 'tests' }
CMBlAggregateElementTest >> testDoesNotShowOtherAggregates [

	| aggregate element |
	self gridWithNeighbourhood: 4.
	aggregate := self
		             aggregateOf: { (model cellAt: 2 at: 2) }
		             pov: CMPointOfView new.
	self
		aggregateOf: { (model cellAt: 2 at: 2) }
		pov: (CMPointOfView color: Color blue).

	element := CMBlAggregateElement for: aggregate.

	self
		assert: ((self formOf: element) colorAt: 16 @ 16)
		equals: Color black
]

{ #category : 'tests' }
CMBlAggregateElementTest >> testKeepsGapsBetweenItsCells [

	| aggregate element |
	self gridWithNeighbourhood: 4.
	aggregate := model createAggregate: CMSpatialEntityAggregate from: {
			             (model cellAt: 1 at: 1).
			             (model cellAt: 2 at: 2) }.

	element := CMBlAggregateElement for: aggregate.

	self assert: (self formOf: element) extent equals: 64 @ 64.
	self assert: (self hexColorIn: element at: 16 @ 16) equals: '000000'.
	self assert: (self hexColorIn: element at: 48 @ 48) equals: '000000'.
	self assert: (self isTransparentIn: element at: 48 @ 16)
]

{ #category : 'tests' }
CMBlAggregateElementTest >> testShowsItsOutlineAroundItsCells [
	"The cells share a side at x = 32, where only their own grey borders must show"

	| element form shared |
	self gridWithNeighbourhood: 4.
	element := CMBlAggregateElement for: (self
			            aggregateOf: {
					            (model cellAt: 2 at: 2).
					            (model cellAt: 2 at: 3) }
			            pov: (CMPointOfView new
					             borderColor: Color red;
					             yourself)).
	form := self formOf: element.
	shared := form colorAt: 32 @ 16.

	self assert: (form colorAt: 16 @ 0) equals: Color red.
	self assert: (shared red closeTo: shared green precision: 0.01).
	self assert: (form colorAt: 16 @ 16) equals: Color black
]

{ #category : 'tests' }
CMBlAggregateElementTest >> testShowsOnlyItsCellsInTheirGridPositions [

	| aggregate element |
	self gridWithNeighbourhood: 4.
	(model cellAt: 2 at: 2) initAlive.
	aggregate := model createAggregate: CMSpatialEntityAggregate from: {
			             (model cellAt: 2 at: 2).
			             (model cellAt: 2 at: 3) }.

	element := CMBlAggregateElement for: aggregate.

	self assert: (self formOf: element) extent equals: 64 @ 32.
	self assert: (self hexColorIn: element at: 16 @ 16) equals: 'FFFFFF'.
	self assert: (self hexColorIn: element at: 48 @ 16) equals: '000000'
]

{ #category : 'tests' }
CMBlAggregateElementTest >> testShowsTheColorOfItsPovOverItsCells [
	"The first cell of the aggregate is at my top-left corner"

	| element |
	self gridWithNeighbourhood: 4.
	element := CMBlAggregateElement for: (self
			            aggregateOf: {
					            (model cellAt: 2 at: 2).
					            (model cellAt: 2 at: 3) }
			            pov: (CMPointOfView color: Color blue)).

	self assert: (self hexColorIn: element at: 16 @ 16) equals: '0000FF'.
	self assert: (self hexColorIn: element at: 48 @ 16) equals: '0000FF'
]

{ #category : 'tests' }
CMBlAggregateElementTest >> testUpdateDoesNotDrawTheShapeTwice [
	"A second copy of a translucent shape would make it stronger"

	| element blue |
	self gridWithNeighbourhood: 4.
	element := CMBlAggregateElement for: (self
			            aggregateOf: { (model cellAt: 2 at: 2) }
			            pov: (CMPointOfView color: (Color blue alpha: 0.5))).

	element update.
	blue := ((self formOf: element) colorAt: 16 @ 16) blue.

	self assert: (blue closeTo: 0.5 precision: 0.02)
]

{ #category : 'tests' }
CMBlAggregateElementTest >> testUpdateKeepsTheShapeAlignedWhenTheCellsChange [
	"A new cell above and to the left of the others moves my top-left corner"

	| aggregate element |
	self gridWithNeighbourhood: 4.
	aggregate := self
		             aggregateOf: { (model cellAt: 2 at: 2) }
		             pov: (CMPointOfView color: Color blue).
	element := CMBlAggregateElement for: aggregate.

	aggregate addComponent: (model cellAt: 1 at: 1).
	element update.

	self assert: (self hexColorIn: element at: 16 @ 16) equals: '0000FF'.
	self assert: (self hexColorIn: element at: 48 @ 48) equals: '0000FF'.
	self assert: (self isTransparentIn: element at: 48 @ 16)
]

{ #category : 'tests' }
CMBlAggregateElementTest >> testUpdateShowsANewPov [

	| aggregate element |
	self gridWithNeighbourhood: 4.
	aggregate := self
		             aggregateOf: { (model cellAt: 2 at: 2) }
		             pov: (CMPointOfView color: Color blue).
	element := CMBlAggregateElement for: aggregate.

	aggregate pov: (CMPointOfView color: Color green).
	element update.

	self
		assert: (self hexColorIn: element at: 16 @ 16)
		equals: Color green asHexString
]

{ #category : 'tests' }
CMBlAggregateElementTest >> testUpdateShowsNewState [

	| aggregate element |
	self gridWithNeighbourhood: 4.
	aggregate := model createAggregate: CMSpatialEntityAggregate from: {
			             (model cellAt: 2 at: 2).
			             (model cellAt: 2 at: 3) }.
	element := CMBlAggregateElement for: aggregate.

	(model cellAt: 2 at: 3) initAlive.
	element update.

	self assert: (self hexColorIn: element at: 48 @ 16) equals: 'FFFFFF'
]
