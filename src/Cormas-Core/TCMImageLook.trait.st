"
I give a look an image, drawn over its color. When the aspect sets an image but no color, the color is transparent, so that an agent's picture shows what is below it.

## Responsibility:

- Hold the image of the look, given by its name or as a `CMImage`.
- Make the default color transparent while the look has an image.

## Collaborators:

- `CMCellLook` and `CMAgentLook` use me.
- `CMImage` describes the image; `String` converts a name into one.

## Public API and Key Messages

- `image:`, `image`, `hasImage`

```
look image: 'grass'.
look color: Color green; image: 'tree'
```

## Internal Representation

- `image`: a `CMImage`, or nil when the look has no image.
"
Trait {
	#name : 'TCMImageLook',
	#instVars : [
		'image'
	],
	#category : 'Cormas-Core-Look',
	#package : 'Cormas-Core',
	#tag : 'Look'
}

{ #category : 'accessing' }
TCMImageLook >> defaultColor [
	"An image is drawn over a transparent color unless the aspect sets one"

	^ self hasImage
		  ifTrue: [ Color transparent ]
		  ifFalse: [ super defaultColor ]
]

{ #category : 'accessing' }
TCMImageLook >> hasImage [

	^ image isNotNil
]

{ #category : 'accessing' }
TCMImageLook >> image [

	^ image
]

{ #category : 'accessing' }
TCMImageLook >> image: anImageOrName [
	"Draw anImageOrName, a CMImage or the name of an image file, over my color"

	image := anImageOrName asCormasImage
]

{ #category : 'initialization' }
TCMImageLook >> resetImage [

	image := nil
]
