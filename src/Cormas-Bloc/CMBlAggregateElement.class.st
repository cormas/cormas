"
I draw a spatial entity aggregate as its component cells, in their grid positions.

## Responsibility:

- Show the elementary cells of my aggregate, and nothing else of the grid.

## Collaborators:

- `CMSpatialEntityAggregate`: answers its elementary cells.

## Public API and Key Messages

- `for:` creates me for an aggregate.
- `update` shows the current state of the cells.

```
(CMBlAggregateElement for: anAggregate) openInNewSpace
```

## Internal Representation

- `aggregate`: the aggregate I draw.
"
Class {
	#name : 'CMBlAggregateElement',
	#superclass : 'CMBlCellGroupElement',
	#instVars : [
		'aggregate'
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

{ #category : 'initialization' }
CMBlAggregateElement >> setUpFor: anAggregate [

	aggregate := anAggregate.
	super setUpFor: anAggregate
]
