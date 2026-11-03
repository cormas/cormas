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
