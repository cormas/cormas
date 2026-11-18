"
I am a picture drawn on the look of a cell or an agent: an image file of the model, or several of them laid over each other, possibly resized, moved and tinted. I am pure data: I know file names, numbers, points and colors, never pixels, so a model that uses me still runs without any UI.

## Responsibility:

- Name the picture that a look shows, and how it is resized, moved and tinted.
- Combine with another image into one that lays it over me, with `+`.
- Compare by value, so that a renderer draws equal images only once.

## Collaborators:

- A look of a cell or an agent holds me, through `image:`.
- `String` converts a name into me, so that `look image: 'grass'` means `look image: (CMImage named: 'grass')`.
- A renderer, such as a Bloc element, finds my files in the model's `images` folder and draws me.

## Public API and Key Messages

- `CMImage named: 'tree'`: the image in the file `tree.png` (or `.jpg`, `.jpeg`) of the model's `images` folder
- `+ anImage`: anImage laid over me; anImage can also be a name
- `size:`: my side as a fraction of the shorter side of the cell. Without it, I cover the cell
- `shift:`: how far I am moved from the centre, in fractions of the cell, y growing downwards
- `tint:`: a color laid over my own pixels; its alpha is the strength of the tint

Most aspects only need a name:

```
look image: 'grass'
```

Combining, resizing, moving and tinting need me:

```
look image: (CMImage named: 'grass') + ((CMImage named: 'flower') size: 0.3; shift: 0.25 @ 0.25).
look image: ((CMImage named: 'grass') tint: (Color blue alpha: 0.4))
```

## Internal Representation

- `size`: a `Number`, or nil while I cover the cell.
- `shift`: a `Point`, in fractions of the cell.
- `tint`: a `Color`; a transparent one leaves my pixels unchanged.

### Implementation Points

- I am abstract. `named:` answers a `CMNamedImage`, and `+` answers a `CMCombinedImage`, which is resized, moved and tinted as a whole.
"
Class {
	#name : 'CMImage',
	#superclass : 'Object',
	#instVars : [
		'size',
		'shift',
		'tint'
	],
	#category : 'Cormas-Core-Look',
	#package : 'Cormas-Core',
	#tag : 'Look'
}

{ #category : 'instance creation' }
CMImage class >> named: aString [
	"Return the image in the file of the model's images folder whose name, without its extension, is aString"

	^ CMNamedImage new setName: aString
]

{ #category : 'combining' }
CMImage >> + anImageOrName [
	"Return an image that lays anImageOrName over me"

	^ CMCombinedImage new setLayers: {
			  self.
			  anImageOrName asCormasImage }
]

{ #category : 'comparing' }
CMImage >> = anObject [

	self == anObject ifTrue: [ ^ true ].
	^ self class = anObject class and: [
			  size = anObject size and: [
				  shift = anObject shift and: [ tint = anObject tint ] ] ]
]

{ #category : 'converting' }
CMImage >> asCormasImage [

	^ self
]

{ #category : 'accessing' }
CMImage >> coversTheCell [
	"Return whether I am scaled to fill the cell and cropped to its centre, because no size was given"

	^ size isNil
]

{ #category : 'comparing' }
CMImage >> hash [

	^ (size hash bitXor: shift hash) bitXor: tint hash
]

{ #category : 'initialization' }
CMImage >> initialize [

	super initialize.
	shift := 0 @ 0.
	tint := Color transparent
]

{ #category : 'accessing' }
CMImage >> shift [

	^ shift
]

{ #category : 'accessing' }
CMImage >> shift: aPoint [
	"Move me from the centre of the cell by aPoint, in fractions of the cell, y growing downwards"

	shift := aPoint
]

{ #category : 'accessing' }
CMImage >> size [

	^ size
]

{ #category : 'accessing' }
CMImage >> size: aNumber [
	"Make my side aNumber, a fraction of the shorter side of the cell, instead of covering the cell"

	size := aNumber
]

{ #category : 'accessing' }
CMImage >> tint [

	^ tint
]

{ #category : 'accessing' }
CMImage >> tint: aColor [
	"Lay aColor over my own pixels. Its alpha is the strength of the tint"

	tint := aColor
]
