"
I describe how a cell appears in a view: its color, an image drawn over it, and its border.

## Responsibility:

- Hold the color of the cell, and the image drawn over it.
- Start with a grey cell and a light border, so that a grid is drawn even when its model defines no aspect.

## Collaborators:

- An aspect of a cell fills me.
- `TCMImageLook` gives me the image, a `CMImage`.
- A renderer draws me, and finds the files of the image in the model's `images` folder.

## Public API and Key Messages

- `color:`
- `image:`, `hasImage`
- `borderColor:`, `borderThickness:`

```
aspectRocky: look
	<aspect>
	look image: 'rocks'
```
"
Class {
	#name : 'CMCellLook',
	#superclass : 'CMAreaLook',
	#traits : 'TCMImageLook',
	#classTraits : 'TCMImageLook classTrait',
	#category : 'Cormas-Core-Look',
	#package : 'Cormas-Core',
	#tag : 'Look'
}

{ #category : 'initialization' }
CMCellLook >> reset [

	super reset.
	self resetImage
]
