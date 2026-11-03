"
I draw a spatial entity aggregate as its component cells, in their grid positions, with its shape on top of them.

## Responsibility:

- Show the elementary cells of my aggregate, and nothing else of the grid.
- Show the shape of my aggregate, and not the shapes of other aggregates on the same cells.

## Collaborators:

- `CMSpatialEntityAggregate`: answers its elementary cells.
- `CMBlAggregateShapeElement`: draws the shape of the aggregate.

## Public API and Key Messages

- `for:` creates me for an aggregate.
- `update` shows the current state of the cells and the shape.

```
(CMBlAggregateElement for: anAggregate) openInNewSpace
```

## Internal Representation

- `aggregate`: the aggregate I draw.
- `shapeElement`: the element of its shape, recreated by each update.
"
Class {
	#name : 'CMBlAggregateElement',
	#superclass : 'CMBlCellGroupElement',
	#instVars : [
		'aggregate',
		'shapeElement'
	],
	#category : 'Cormas-Bloc',
	#package : 'Cormas-Bloc'
}

{ #category : 'examples' }
CMBlAggregateElement class >> exampleOfTwoCells [

	<sampleInstance>
	| model |
	model := CMMockModel new.
	model initFixed.
	^ self for: (model createAggregate: CMSpatialEntityAggregate from: {
				   (model cellAt: 1 at: 1).
				   (model cellAt: 2 at: 2) })
]

{ #category : 'accessing' }
CMBlAggregateElement >> cells [

	^ aggregate elementaryComponents
]

{ #category : 'updating' }
CMBlAggregateElement >> refresh [
	"The shape is positioned on the grid, and is added last so that it appears on top of the cells"

	shapeElement ifNotNil: [ self removeChild: shapeElement ].
	super refresh.
	shapeElement := (CMBlAggregateShapeElement for: aggregate)
		                position: gridOrigin negated;
		                yourself.
	self addChild: shapeElement
]

{ #category : 'initialization' }
CMBlAggregateElement >> setUpFor: anAggregate [

	aggregate := anAggregate.
	super setUpFor: anAggregate
]
