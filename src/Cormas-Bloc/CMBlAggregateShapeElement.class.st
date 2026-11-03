"
I draw an aggregate as one shape, covering all its cells in their grid positions. I am meant to be placed on top of the elements of those cells.

## Responsibility:

- Fill my shape with the color of the active point of view of my aggregate, or stay transparent when it has no color, so that the cells show through.
- Draw a line around my shape, including around its holes, when that point of view has a border.
- Ignore the tile, shape and size of that point of view.

## Collaborators:

- `CMSpatialEntityAggregate`: answers its cells and its active point of view.
- `CMPointOfView`: tells which color and border were specified.

## Public API and Key Messages

- `for:` creates me for an aggregate.
- `update` shows the current state of the aggregate.

```
(CMBlAggregateShapeElement for: anAggregate) openInNewSpace
```

## Internal Representation

- `aggregate`: the aggregate I draw.
- `polygons`: the vertices of each of its cells, in pixels, with 0@0 at the origin of the grid.
- `sides`: the sides that make up the outline, each a set of two vertices.

### Implementation Points

All the cells are drawn as one path. Drawing each cell separately would leave visible seams between them when the color is translucent or when they do not sit on whole pixels.

A side is on the outline when only one of the cells has it. This works on every grid type and needs no knowledge of neighbours. The line is centered on the side, so half of it extends over the neighbouring cells, and possibly outside my bounds.
"
Class {
	#name : 'CMBlAggregateShapeElement',
	#superclass : 'CMBlElement',
	#instVars : [
		'aggregate',
		'polygons',
		'sides'
	],
	#category : 'Cormas-Bloc',
	#package : 'Cormas-Bloc'
}

{ #category : 'examples' }
CMBlAggregateShapeElement class >> exampleOfAnLShape [

	<sampleInstance>
	| model |
	model := CMMockModel new.
	model initFixed.
	^ self for: (model createAggregate: CMMockAggregate from: {
				   (model cellAt: 1 at: 1).
				   (model cellAt: 2 at: 1).
				   (model cellAt: 2 at: 2) })
]

{ #category : 'drawing' }
CMBlAggregateShapeElement >> aeDrawGeometryOn: aeCanvas [
	"Draw all my cells at once, then the line around them, instead of the geometry of an element"

	self background isTransparent ifFalse: [ self drawFillOn: aeCanvas ].
	self border isTransparent ifFalse: [ self drawOutlineOn: aeCanvas ]
]

{ #category : 'drawing' }
CMBlAggregateShapeElement >> appendPolygonsTo: aCairoContext [

	polygons do: [ :vertices |
			aCairoContext moveTo: vertices first.
			vertices allButFirstDo: [ :each | aCairoContext lineTo: each ].
			aCairoContext closePath ]
]

{ #category : 'drawing' }
CMBlAggregateShapeElement >> appendSidesTo: aCairoContext [

	sides do: [ :each |
			| vertices |
			vertices := each asArray.
			aCairoContext
				moveTo: vertices first;
				lineTo: vertices second ]
]

{ #category : 'drawing' }
CMBlAggregateShapeElement >> drawFillOn: aeCanvas [

	aeCanvas pathFactory: [ :cairoContext |
		self appendPolygonsTo: cairoContext ].
	self background aeApplyTo: aeCanvas.
	aeCanvas
		setBorderOff;
		drawFigure
]

{ #category : 'drawing' }
CMBlAggregateShapeElement >> drawOutlineOn: aeCanvas [
	"Square caps close the corners where two sides meet"

	aeCanvas
		pathFactory: [ :cairoContext | self appendSidesTo: cairoContext ];
		setBackgroundOff;
		setOutskirtsCentered;
		setBorderBlock: [
				self border paint aeApplyTo: aeCanvas.
				aeCanvas
					setCapSquare;
					setBorderWidth: self border width ];
		drawFigure
]

{ #category : 'updating' }
CMBlAggregateShapeElement >> refresh [

	| pov |
	pov := aggregate activePov.
	polygons := aggregate elementaryComponents collect: [ :each |
		            self verticesOfCell: each ].
	sides := self sidesOfOnlyOneCell.
	self
		extent: ((polygons flatCollect: [ :each | each ])
				 inject: 0 @ 0
				 into: [ :corner :each | corner max: each ]);
		background: (pov hasColor
				 ifTrue: [ pov color ]
				 ifFalse: [ Color transparent ]);
		border: (pov hasBorder
				 ifTrue: [
						 BlBorder
							 paint: pov borderColor
							 width: pov outlineWidth * self cellSize ]
				 ifFalse: [ BlBorder empty ]);
		invalidate
]

{ #category : 'initialization' }
CMBlAggregateShapeElement >> setUpFor: anAggregate [

	aggregate := anAggregate.
	self refresh
]

{ #category : 'geometry' }
CMBlAggregateShapeElement >> sidesOfOnlyOneCell [
	"Answer the sides that belong to a single cell, which are the ones on the outline. Vertices are rounded because neighbouring cells compute a shared vertex slightly differently"

	| allSides |
	allSides := Bag new.
	polygons do: [ :vertices |
			vertices withIndexDo: [ :each :index |
					allSides add: {
							(each roundTo: 0.001).
							((vertices atWrap: index + 1) roundTo: 0.001) } asSet ] ].
	^ allSides asSet select: [ :each |
		  (allSides occurrencesOf: each) = 1 ]
]

{ #category : 'geometry' }
CMBlAggregateShapeElement >> verticesOfCell: aCell [
	"Answer the vertices of aCell in pixels, on a grid starting at 0@0"

	| position extent |
	position := self gridPositionOfCell: aCell.
	extent := self cellExtentOf: aCell.
	^ ((self neighbourhoodOf: aCell) blocCellVerticesFor: aCell)
		  collect: [ :each | each * extent + position ]
]
