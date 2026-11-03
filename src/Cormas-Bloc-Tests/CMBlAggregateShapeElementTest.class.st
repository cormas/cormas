"
I test the shape of an aggregate, by reading the pixels of the rendered element.

## Responsibility:

- Check where the shape is drawn, with which color, and what stays empty.
- Check that one shape has no seams between its cells, on every grid type and when zoomed.
- Check that `update` shows the changes made to the aggregate.

## Collaborators:

- `CMBlAggregateShapeElement`: the class under test.
- `CMMockAggregate`: an aggregate with the point of view a test gives it.

## Public API and Key Messages

Expected pixel positions are worked out from the size of a cell, 32 pixels.
"
Class {
	#name : 'CMBlAggregateShapeElementTest',
	#superclass : 'CMBlTestCase',
	#category : 'Cormas-Bloc-Tests',
	#package : 'Cormas-Bloc-Tests'
}

{ #category : 'private' }
CMBlAggregateShapeElementTest >> aggregateOf: someCells pov: aPointOfView [

	^ (model createAggregate: CMMockAggregate from: someCells)
		  pov: aPointOfView;
		  yourself
]

{ #category : 'private' }
CMBlAggregateShapeElementTest >> assertNoSeamsInGrid: aNeighbourhood scale: aNumber [
	"Every pixel in the box around a cell surrounded by others must have the same translucent color"

	| element parent box form colors |
	self gridWithNeighbourhood: aNeighbourhood.
	element := CMBlAggregateShapeElement for: (self
			            aggregateOf: model cells
			            pov: (CMPointOfView color: (Color red alpha: 0.5))).
	element transformDo: [ :transform | transform scaleBy: aNumber ].
	parent := BlElement new
		          extent: 400 @ 400;
		          addChild: element;
		          yourself.

	box := (element gridPositionOfCell: (model cellAt: 2 at: 2)) extent:
		       (element cellExtentOf: (model cellAt: 2 at: 2)).
	form := self formOf: parent.
	colors := Set new.
	(box origin * aNumber) ceiling y to:
		(box corner * aNumber) floor y - 1 do: [ :y |
			(box origin * aNumber) ceiling x to:
			(box corner * aNumber) floor x - 1 do: [ :x |
			colors add: (form colorAt: x @ y) ] ].

	self assert: colors size equals: 1.
	self assert: (colors anyOne alpha closeTo: 0.5 precision: 0.02)
]

{ #category : 'private' }
CMBlAggregateShapeElementTest >> assertOutlineInGrid: aNeighbourhood [
	"The middle of the side shared by two cells must stay empty, and the middle of each other side must have a line"

	| first second aggregate element sidesOfFirst sidesOfSecond shared |
	self gridWithNeighbourhood: aNeighbourhood.
	first := model cellAt: 2 at: 2.
	second := model cellAt: 2 at: 3.
	aggregate := self
		             aggregateOf: {
				             first.
				             second }
		             pov: self outlinePov.
	element := CMBlAggregateShapeElement for: aggregate.

	sidesOfFirst := self sidesOf: (element verticesOfCell: first).
	sidesOfSecond := self sidesOf: (element verticesOfCell: second).
	shared := sidesOfFirst intersection: sidesOfSecond.
	self assert: shared size equals: 1.

	self assert: (self
			 isTransparentAround: aggregate
			 at: (self middleOf: shared anyOne)).
	(sidesOfFirst , sidesOfSecond copyWithoutAll: shared) do: [ :side |
		self assert: (self isOutlineOf: aggregate at: (self middleOf: side)) ]
]

{ #category : 'private' }
CMBlAggregateShapeElementTest >> hexColorInShapeOf: anAggregate at: aPoint [
	"Answer the color at a point of the grid, leaving room around the shape for the outer half of its outline"

	^ self
		  hexColorIn: (self parentOfShapeOf: anAggregate)
		  at: aPoint + 16
]

{ #category : 'private' }
CMBlAggregateShapeElementTest >> isOutlineOf: anAggregate at: aPoint [

	^ (self hexColorInShapeOf: anAggregate at: aPoint)
	  = Color red asHexString
]

{ #category : 'private' }
CMBlAggregateShapeElementTest >> isTransparentAround: anAggregate at: aPoint [

	^ self
		  isTransparentIn: (self parentOfShapeOf: anAggregate)
		  at: aPoint + 16
]

{ #category : 'private' }
CMBlAggregateShapeElementTest >> middleOf: aSide [

	^ aSide inject: 0 @ 0 into: [ :sum :each | sum + (each / 2) ]
]

{ #category : 'private' }
CMBlAggregateShapeElementTest >> outlinePov [

	^ CMPointOfView new
		  borderColor: Color red;
		  yourself
]

{ #category : 'private' }
CMBlAggregateShapeElementTest >> parentOfShapeOf: anAggregate [

	^ BlElement new
		  extent: 300 @ 300;
		  addChild: ((CMBlAggregateShapeElement for: anAggregate)
				   position: 16 @ 16;
				   yourself);
		  yourself
]

{ #category : 'private' }
CMBlAggregateShapeElementTest >> sidesOf: someVertices [

	^ someVertices withIndexCollect: [ :each :index |
			  {
				  (each roundTo: 0.001).
				  ((someVertices atWrap: index + 1) roundTo: 0.001) } asSet ]
]

{ #category : 'tests' }
CMBlAggregateShapeElementTest >> testDrawsTheCellsOfNestedAggregates [

	| inner outer element |
	self gridWithNeighbourhood: 4.
	inner := self
		         aggregateOf: { (model cellAt: 2 at: 2) }
		         pov: CMPointOfView new.
	outer := self
		         aggregateOf: { inner }
		         pov: (CMPointOfView color: Color red).

	element := CMBlAggregateShapeElement for: outer.

	self
		assert: (self hexColorIn: element at: 48 @ 48)
		equals: Color red asHexString
]

{ #category : 'tests' }
CMBlAggregateShapeElementTest >> testFillsItsCellsWithTheColorOfThePov [

	| element |
	self gridWithNeighbourhood: 4.
	element := CMBlAggregateShapeElement for: (self
			            aggregateOf: {
					            (model cellAt: 1 at: 1).
					            (model cellAt: 2 at: 2) }
			            pov: (CMPointOfView color: Color red)).

	self
		assert: (self hexColorIn: element at: 16 @ 16)
		equals: Color red asHexString.
	self
		assert: (self hexColorIn: element at: 48 @ 48)
		equals: Color red asHexString.
	self assert: (self isTransparentIn: element at: 48 @ 16)
]

{ #category : 'tests' }
CMBlAggregateShapeElementTest >> testIgnoresATile [

	| element |
	self gridWithNeighbourhood: 4.
	element := CMBlAggregateShapeElement for:
		           (self
			            aggregateOf: model cells
			            pov: ((CMPointOfView color: Color red)
					             tile: #aTile;
					             yourself)).

	self
		assert: (self hexColorIn: element at: 16 @ 16)
		equals: Color red asHexString
]

{ #category : 'tests' }
CMBlAggregateShapeElementTest >> testIsTransparentWithoutAColor [

	| element |
	self gridWithNeighbourhood: 4.
	element := CMBlAggregateShapeElement for:
		           (self aggregateOf: model cells pov: CMPointOfView new).

	self assert: (self isTransparentIn: element at: 16 @ 16)
]

{ #category : 'tests' }
CMBlAggregateShapeElementTest >> testKeepsItsCellsInTheirGridPositions [

	| element |
	self gridWithNeighbourhood: 4.
	element := CMBlAggregateShapeElement for: (self
			            aggregateOf: { (model cellAt: 2 at: 3) }
			            pov: (CMPointOfView color: Color red)).

	self
		assert: (self hexColorIn: element at: 80 @ 48)
		equals: Color red asHexString.
	self assert: (self isTransparentIn: element at: 16 @ 16)
]

{ #category : 'tests' }
CMBlAggregateShapeElementTest >> testLeavesHolesEmpty [

	| element |
	self gridWithNeighbourhood: 4.
	element := CMBlAggregateShapeElement for: (self
			            aggregateOf: ((1 to: 3) flatCollect: [ :row |
						             ((1 to: 3) reject: [ :column |
							              row = 2 and: [ column = 2 ] ]) collect: [ :column |
							             model cellAt: row at: column ] ])
			            pov: (CMPointOfView color: Color red)).

	self assert: (self isTransparentIn: element at: 48 @ 48).
	self
		assert: (self hexColorIn: element at: 16 @ 48)
		equals: Color red asHexString
]

{ #category : 'tests' }
CMBlAggregateShapeElementTest >> testNoOutlineWithoutABorder [

	| aggregate |
	self gridWithNeighbourhood: 4.
	aggregate := self
		             aggregateOf: { (model cellAt: 2 at: 2) }
		             pov: CMPointOfView new.

	self assert: (self isTransparentAround: aggregate at: 48 @ 32)
]

{ #category : 'tests' }
CMBlAggregateShapeElementTest >> testNoSeamsInGridOfFlatTopHexagons [

	self assertNoSeamsInGrid: #flat6 scale: 1
]

{ #category : 'tests' }
CMBlAggregateShapeElementTest >> testNoSeamsInGridOfPointyTopHexagons [

	self assertNoSeamsInGrid: 6 scale: 1
]

{ #category : 'tests' }
CMBlAggregateShapeElementTest >> testNoSeamsInGridOfSquares [

	self assertNoSeamsInGrid: 4 scale: 1
]

{ #category : 'tests' }
CMBlAggregateShapeElementTest >> testNoSeamsInGridOfTriangles [

	self assertNoSeamsInGrid: 3 scale: 1
]

{ #category : 'tests' }
CMBlAggregateShapeElementTest >> testNoSeamsWhenZoomed [

	self assertNoSeamsInGrid: 4 scale: 1.37.
	self assertNoSeamsInGrid: 6 scale: 1.37
]

{ #category : 'tests' }
CMBlAggregateShapeElementTest >> testOutlineFollowsTheCellsOfNestedAggregates [

	| inner aggregate |
	self gridWithNeighbourhood: 4.
	inner := self
		         aggregateOf: {
				         (model cellAt: 2 at: 2).
				         (model cellAt: 2 at: 3) }
		         pov: CMPointOfView new.
	aggregate := self aggregateOf: { inner } pov: self outlinePov.

	self assert: (self isOutlineOf: aggregate at: 32 @ 48).
	self assert: (self isTransparentAround: aggregate at: 64 @ 48)
]

{ #category : 'tests' }
CMBlAggregateShapeElementTest >> testOutlineGoesAroundHoles [

	| aggregate |
	self gridWithNeighbourhood: 4.
	aggregate := self
		             aggregateOf:
		             (model cells reject: [ :each |
			              each = (model cellAt: 2 at: 2) ])
		             pov: self outlinePov.

	self assert: (self isOutlineOf: aggregate at: 48 @ 32).
	self assert: (self isTransparentAround: aggregate at: 48 @ 48)
]

{ #category : 'tests' }
CMBlAggregateShapeElementTest >> testOutlineGoesAroundItsCells [

	| aggregate |
	self gridWithNeighbourhood: 4.
	aggregate := self
		             aggregateOf: { (model cellAt: 2 at: 2) }
		             pov: self outlinePov.

	{
		(48 @ 32).
		(64 @ 48).
		(48 @ 64).
		(32 @ 48) } do: [ :each |
		self assert: (self isOutlineOf: aggregate at: each) ].
	self assert: (self isTransparentAround: aggregate at: 48 @ 48)
]

{ #category : 'tests' }
CMBlAggregateShapeElementTest >> testOutlineHasADefaultColor [

	| aggregate |
	self gridWithNeighbourhood: 4.
	aggregate := self
		             aggregateOf: { (model cellAt: 2 at: 2) }
		             pov: (CMPointOfView new borderWidth: 0.25).

	self
		assert: (self hexColorInShapeOf: aggregate at: 48 @ 32)
		equals: Color veryLightGray asHexString
]

{ #category : 'tests' }
CMBlAggregateShapeElementTest >> testOutlineHasADefaultWidth [
	"The default width of 0.1 on a cell of 32 pixels is 3.2 pixels, centered on the side at y = 32"

	| aggregate |
	self gridWithNeighbourhood: 4.
	aggregate := self
		             aggregateOf: { (model cellAt: 2 at: 2) }
		             pov: self outlinePov.

	self assert: (self isOutlineOf: aggregate at: 48 @ 31).
	self assert: (self isTransparentAround: aggregate at: 48 @ 28)
]

{ #category : 'tests' }
CMBlAggregateShapeElementTest >> testOutlineHasClosedCorners [

	| aggregate |
	self gridWithNeighbourhood: 4.
	aggregate := self
		             aggregateOf: { (model cellAt: 2 at: 2) }
		             pov: self outlinePov.

	self assert: (self isOutlineOf: aggregate at: 31 @ 31)
]

{ #category : 'tests' }
CMBlAggregateShapeElementTest >> testOutlineHasLinesAtTheWrapAroundOfATorus [
	"Cells 1@1 and 1@4 are neighbours on a torus, but the view shows them on opposite sides"

	| aggregate |
	model := CMMockModel new.
	model
		createGridNumberOfRows: 3
		numberOfColumns: 4
		neighbourhood: 4
		closed: false.
	model cells do: #initDead.
	aggregate := self
		             aggregateOf: {
				             (model cellAt: 1 at: 1).
				             (model cellAt: 1 at: 4) }
		             pov: self outlinePov.

	self assert: (self isOutlineOf: aggregate at: 0 @ 16).
	self assert: (self isOutlineOf: aggregate at: 128 @ 16)
]

{ #category : 'tests' }
CMBlAggregateShapeElementTest >> testOutlineInGridOfFlatTopHexagons [

	self assertOutlineInGrid: #flat6
]

{ #category : 'tests' }
CMBlAggregateShapeElementTest >> testOutlineInGridOfPointyTopHexagons [

	self assertOutlineInGrid: 6
]

{ #category : 'tests' }
CMBlAggregateShapeElementTest >> testOutlineInGridOfSquares [

	self assertOutlineInGrid: 4
]

{ #category : 'tests' }
CMBlAggregateShapeElementTest >> testOutlineInGridOfSquaresWithEightNeighbours [

	self assertOutlineInGrid: 8
]

{ #category : 'tests' }
CMBlAggregateShapeElementTest >> testOutlineInGridOfTriangles [

	self assertOutlineInGrid: 3
]

{ #category : 'tests' }
CMBlAggregateShapeElementTest >> testOutlineIsDrawnOverTheFill [
	"The pixels at y = 32 are the first row inside the cell, and the line covers them"

	| aggregate |
	self gridWithNeighbourhood: 4.
	aggregate := self
		             aggregateOf: { (model cellAt: 2 at: 2) }
		             pov: (self outlinePov color: Color blue).

	self assert: (self isOutlineOf: aggregate at: 48 @ 32).
	self
		assert: (self hexColorInShapeOf: aggregate at: 48 @ 48)
		equals: Color blue asHexString
]

{ #category : 'tests' }
CMBlAggregateShapeElementTest >> testOutlineSkipsSidesBetweenItsCells [

	| aggregate |
	self gridWithNeighbourhood: 4.
	aggregate := self
		             aggregateOf: {
				             (model cellAt: 2 at: 2).
				             (model cellAt: 2 at: 3) }
		             pov: self outlinePov.

	self assert: (self isTransparentAround: aggregate at: 64 @ 48).
	self assert: (self isOutlineOf: aggregate at: 96 @ 48)
]

{ #category : 'tests' }
CMBlAggregateShapeElementTest >> testOutlineWidthIsAFractionOfTheCell [
	"A width of 0.25 on a cell of 32 pixels is 8 pixels, centered on the side at y = 32"

	| aggregate |
	self gridWithNeighbourhood: 4.
	aggregate := self
		             aggregateOf: { (model cellAt: 2 at: 2) }
		             pov: (self outlinePov borderWidth: 0.25).

	self assert: (self isOutlineOf: aggregate at: 48 @ 29).
	self assert: (self isTransparentAround: aggregate at: 48 @ 27)
]

{ #category : 'tests' }
CMBlAggregateShapeElementTest >> testTranslucentColorStaysTranslucent [

	| element alpha |
	self gridWithNeighbourhood: 4.
	element := CMBlAggregateShapeElement for: (self
			            aggregateOf: model cells
			            pov: (CMPointOfView color: (Color red alpha: 0.5))).

	alpha := ((self formOf: element) colorAt: 16 @ 16) alpha.

	self assert: (alpha closeTo: 0.5 precision: 0.02)
]

{ #category : 'tests' }
CMBlAggregateShapeElementTest >> testTransparentColorDrawsNothing [

	| element |
	self gridWithNeighbourhood: 4.
	element := CMBlAggregateShapeElement for: (self
			            aggregateOf: model cells
			            pov: (CMPointOfView color: Color transparent)).

	self assert: (self isTransparentIn: element at: 16 @ 16)
]

{ #category : 'tests' }
CMBlAggregateShapeElementTest >> testUpdateShowsANewColor [

	| aggregate element |
	self gridWithNeighbourhood: 4.
	aggregate := self
		             aggregateOf: model cells
		             pov: (CMPointOfView color: Color red).
	element := CMBlAggregateShapeElement for: aggregate.

	aggregate pov: (CMPointOfView color: Color blue).
	element update.

	self
		assert: (self hexColorIn: element at: 16 @ 16)
		equals: Color blue asHexString
]

{ #category : 'tests' }
CMBlAggregateShapeElementTest >> testUpdateShowsNewCells [

	| aggregate element |
	self gridWithNeighbourhood: 4.
	aggregate := self
		             aggregateOf: { (model cellAt: 1 at: 1) }
		             pov: (CMPointOfView color: Color red).
	element := CMBlAggregateShapeElement for: aggregate.

	aggregate addComponent: (model cellAt: 2 at: 2).
	element update.

	self
		assert: (self hexColorIn: element at: 48 @ 48)
		equals: Color red asHexString
]

{ #category : 'tests' }
CMBlAggregateShapeElementTest >> testUpdateShowsTheNewOutline [

	| aggregate parent shape |
	self gridWithNeighbourhood: 4.
	aggregate := self
		             aggregateOf: { (model cellAt: 2 at: 2) }
		             pov: self outlinePov.
	parent := self parentOfShapeOf: aggregate.
	shape := parent children first.
	self
		assert: (self hexColorIn: parent at: 64 @ 48 + 16)
		equals: Color red asHexString.

	aggregate addComponent: (model cellAt: 2 at: 3).
	shape update.

	self assert: (self isTransparentIn: parent at: 64 @ 48 + 16)
]
