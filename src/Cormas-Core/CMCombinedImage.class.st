"
I am an image made of other images laid over each other, the first at the bottom. I am resized, moved and tinted as a whole, and my layers keep their own size, shift and tint inside me.

## Responsibility:

- Know my layers, in the order they are drawn.
- Be equal to another combination of equal layers, with the same size, shift and tint.

## Collaborators:

- `CMImage` creates me with `+`, and holds what I share with every image.
- My layers are images: `CMNamedImage`s, or other combinations.

## Public API and Key Messages

- `+`, sent to any image
- `layers`

```
(CMImage named: 'grass') + ((CMImage named: 'tree') size: 0.5)
```

## Internal Representation

- `layers`: an `Array` of images, the first at the bottom.
"
Class {
	#name : 'CMCombinedImage',
	#superclass : 'CMImage',
	#instVars : [
		'layers'
	],
	#category : 'Cormas-Core-Look',
	#package : 'Cormas-Core',
	#tag : 'Look'
}

{ #category : 'comparing' }
CMCombinedImage >> = anObject [

	^ super = anObject and: [ layers = anObject layers ]
]

{ #category : 'comparing' }
CMCombinedImage >> hash [

	^ super hash bitXor: layers hash
]

{ #category : 'accessing' }
CMCombinedImage >> layers [

	^ layers
]

{ #category : 'accessing' }
CMCombinedImage >> setLayers: anArray [

	layers := anArray
]
