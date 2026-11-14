"
I am an agent whose look is set by a test, so that tests can draw any shape, color and size.

## Responsibility:

- Fill my look with the block a test gave me.

## Collaborators:

- `CMAgentLook`: the look the block fills.

## Public API and Key Messages

- `aspect:` sets the block that fills my look.

```
agent aspect: [ :look | look color: Color red; shape: #square; size: 1 ]
```

## Internal Representation

- `customAspect`: a block that takes my look, which does nothing until a test sets it.
"
Class {
	#name : 'CMBlTestAgent',
	#superclass : 'CMAgent',
	#instVars : [
		'testPov',
		'customAspect'
	],
	#category : 'Cormas-Bloc-Tests',
	#package : 'Cormas-Bloc-Tests'
}

{ #category : 'aspects' }
CMBlTestAgent >> aspect: aBlock [
	"Each test gives an agent the look it needs through a block that fills it"

	customAspect := aBlock
]

{ #category : 'aspects' }
CMBlTestAgent >> aspectDefault: look [

	<aspect>
	customAspect value: look
]

{ #category : 'aspects' }
CMBlTestAgent >> initialize [

	super initialize.
	customAspect := [ :look |  ]
]
