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
