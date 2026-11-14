"
I am an aggregate that can be given any look, so that examples and tests can show every way of drawing an aggregate.

## Responsibility:

- Fill my look with the block I was given, after the default aspect of aggregates.

## Collaborators:

- `CMAggregateLook`: describes how I look.

## Public API and Key Messages

- `aspect:` sets the block that fills my look.

```
(model createAggregate: CMMockAggregate from: someCells)
	aspect: [ :look | look color: Color orange ]
```

## Internal Representation

- `customAspect`: a block that takes my look, which does nothing until a test sets it.
"
Class {
	#name : 'CMMockAggregate',
	#superclass : 'CMSpatialEntityAggregate',
	#instVars : [
		'customPov',
		'customAspect'
	],
	#category : 'Cormas-Mocks',
	#package : 'Cormas-Mocks'
}

{ #category : 'aspects' }
CMMockAggregate >> aspect: aBlock [
	"Each test gives an aggregate the look it needs through a block that fills it, instead of a separate aspect method"

	customAspect := aBlock
]

{ #category : 'aspects' }
CMMockAggregate >> aspectDefault: look [

	<aspect>
	super aspectDefault: look.
	customAspect value: look
]

{ #category : 'aspects' }
CMMockAggregate >> initialize [

	super initialize.
	customAspect := [ :look |  ]
]
