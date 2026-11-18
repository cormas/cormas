"
I describe how an agent appears in a view: its color, an image drawn over it, its shape, its size and its border.

## Responsibility:

- Hold the shape and the size of the agent, with its color, its image and its border.
- Compute the size from an attribute, with `sizeForValue:from:to:`.
- Start with a small grey circle, so that agents are drawn even when their model defines no aspect.

## Collaborators:

- An aspect of an agent fills me.
- `TCMImageLook` gives me the image, a `CMImage`.
- A renderer draws me.

## Public API and Key Messages

- `shape:` with one of `#circle #square #diamond #triangle #hexagon #star`
- `size:`, `sizeForValue:from:to:`
- `color:`, `image:`, `hasImage`, `borderColor:`, `borderThickness:`

```
aspectEnergy: look
	<aspect>
	look
		color: Color orange;
		shape: #triangle;
		sizeForValue: energy from: 0 to: 100
```

## Internal Representation

- `shape`: a `Symbol`.
- `size`: a `Number`, as a fraction of the side of a cell.
"
Class {
	#name : 'CMAgentLook',
	#superclass : 'CMAreaLook',
	#traits : 'TCMImageLook',
	#classTraits : 'TCMImageLook classTrait',
	#instVars : [
		'shape',
		'size'
	],
	#category : 'Cormas-Core-Look',
	#package : 'Cormas-Core',
	#tag : 'Look'
}

{ #category : 'initialization' }
CMAgentLook >> reset [

	super reset.
	self resetImage.
	shape := #circle.
	size := 0.3.
	borderThickness := 0
]

{ #category : 'accessing' }
CMAgentLook >> shape [

	^ shape
]

{ #category : 'accessing' }
CMAgentLook >> shape: aSymbol [

	shape := aSymbol
]

{ #category : 'accessing' }
CMAgentLook >> size [

	^ size
]

{ #category : 'accessing' }
CMAgentLook >> size: aNumber [

	size := aNumber
]

{ #category : 'helpers' }
CMAgentLook >> sizeForValue: aNumber from: minimum to: maximum [
	"Use a size that goes from small at the minimum to a full cell at the maximum. Values outside the range are clamped"

	size := 0.1 + (0.9 * (self fractionOf: aNumber from: minimum to: maximum))
]
