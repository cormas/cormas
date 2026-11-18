"
I am a cell whose look is set by a test, for looks that the mock cells do not have, such as images.

## Responsibility:

- Fill my look with the block a test gave me.

## Collaborators:

- `CMBlImageElementTest`: sets my look.

## Public API and Key Messages

- `aspect:` sets the block that fills my look.

```
cell aspect: [ :look | look image: 'grass' ]
```

## Internal Representation

- `customAspect`: a block that takes my look, which does nothing until a test sets it.
"
Class {
	#name : 'CMBlTestCell',
	#superclass : 'CMCell',
	#instVars : [
		'testPov',
		'customAspect'
	],
	#category : 'Cormas-Bloc-Tests',
	#package : 'Cormas-Bloc-Tests'
}

{ #category : 'aspects' }
CMBlTestCell >> aspect: aBlock [
	"Each test gives a cell the look it needs through a block that fills it"

	customAspect := aBlock
]

{ #category : 'aspects' }
CMBlTestCell >> aspectDefault: look [

	<aspect>
	customAspect value: look
]

{ #category : 'aspects' }
CMBlTestCell >> initialize [

	super initialize.
	customAspect := [ :look |  ]
]
