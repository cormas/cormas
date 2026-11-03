"
I draw an aggregate as one shape, covering all its cells in their grid positions. I am meant to be placed on top of the elements of those cells.

## Responsibility:

- Fill my shape with the color of the active point of view of my aggregate.
- Stay transparent when that point of view has no color, so that the cells show through.
- Ignore the tile, shape and size of that point of view.

## Collaborators:

- `CMSpatialEntityAggregate`: answers its cells and its active point of view.
- `CMPointOfView`: tells which color was specified.

## Public API and Key Messages

- `for:` creates me for an aggregate.
- `update` shows the current state of the aggregate.

```
(CMBlAggregateShapeElement for: anAggregate) openInNewSpace
```

## Internal Representation

- `aggregate`: the aggregate I draw.
- `polygons`: the vertices of each of its cells, in pixels, with 0@0 at the origin of the grid.

### Implementation Points

All the cells are drawn as one path. Drawing each cell separately would leave visible seams between them when the color is translucent or when they do not sit on whole pixels.
"
Class {
	#name : 'CMBlAggregateShapeElement',
	#superclass : 'CMBlElement',
	#instVars : [
		'aggregate',
		'polygons'
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
	"Draw all my cells at once instead of the geometry of an element"

	self background isTransparent ifTrue: [ ^ self ].
	aeCanvas pathFactory: [ :cairoContext |
		self appendPolygonsTo: cairoContext ].
	self background aeApplyTo: aeCanvas.
	aeCanvas
		setBorderOff;
		drawFigure
]

{ #category : 'drawing' }
CMBlAggregateShapeElement >> appendPolygonsTo: aCairoContext [

	polygons do: [ :vertices |
			aCairoContext moveTo: vertices first.
			vertices allButFirstDo: [ :each | aCairoContext lineTo: each ].
			aCairoContext closePath ]
]

{ #category : 'updating' }
CMBlAggregateShapeElement >> refresh [

	| pov |
	pov := aggregate activePov.
	polygons := aggregate elementaryComponents collect: [ :each |
		            self verticesOfCell: each ].
	self
		extent: ((polygons flatCollect: [ :each | each ])
				 inject: 0 @ 0
				 into: [ :corner :each | corner max: each ]);
		background: (pov hasColor
				 ifTrue: [ pov color ]
				 ifFalse: [ Color transparent ]);
		invalidate
]

{ #category : 'initialization' }
CMBlAggregateShapeElement >> setUpFor: anAggregate [

	aggregate := anAggregate.
	self refresh
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
