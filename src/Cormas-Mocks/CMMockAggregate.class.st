"
I am an aggregate that can be given any point of view, so that examples and tests can show every way of drawing an aggregate.

## Responsibility:

- Answer the point of view I was given.
- Answer a visible point of view when I was given none.

## Collaborators:

- `CMPointOfView`: describes how I look.

## Public API and Key Messages

- `pov:` sets my point of view.
- `pov` answers it.

```
(model createAggregate: CMMockAggregate from: someCells)
	pov: (CMPointOfView color: Color orange)
```

## Internal Representation

- `customPov`: the point of view I was given, or nil.
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

{ #category : 'pov' }
CMMockAggregate >> pov [

	<pov>
	^ customPov ifNil: [ CMPointOfView color: Color orange ]
]

{ #category : 'pov' }
CMMockAggregate >> pov: aPointOfView [

	customPov := aPointOfView
]
