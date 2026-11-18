"
I am the background of an element that shows a `CMImage`. I hold the image already drawn, once, at the number of pixels the element covers on the screen, so painting me costs as little as painting a color.

## Responsibility:

- Draw a `CMImage` at the pixel size of an element: covering it, or resized, moved and tinted, with its layers laid in order.
- Fill the element with that drawing, scaled to the element's logical extent, so it stays sharp when the view is zoomed in or the screen has more pixels than points.

## Collaborators:

- `CMImage` describes what to draw; its extension methods in this package draw it with Cairo.
- `CMBlImageFolder` gives the Cairo surfaces of the image files.
- `AeCanvas` paints me when Bloc draws the element.

## Public API and Key Messages

- `CMBlImageBackground image: anImage extent: aPoint scale: aNumber folder: aFolder`: an element of logical extent aPoint is drawn with aNumber pixels per point.

```
element background: (CMBlImageBackground
	image: (CMImage named: 'grass') + ((CMImage named: 'tree') size: 0.5)
	extent: 32 @ 32
	scale: 2
	folder: (CMBlImageFolder on: CMMyModel folder / 'images'))
```

## Internal Representation

- `surface`: an `AeCairoImageSurface` of the element's extent times the scale, whose device scale is the scale.

### Implementation Points

- Bloc's `BlImageBackground` converts its form at every paint unless the form is among the last 400 converted, and draws it at its own size. I keep my surface, and its device scale makes Cairo draw it at the element's size.
- Elements that show the same image at the same size must share one instance of me; that sharing is what makes images as fast as colors.
"
Class {
	#name : 'CMBlImageBackground',
	#superclass : 'BlBackground',
	#instVars : [
		'surface'
	],
	#category : 'Cormas-Bloc',
	#package : 'Cormas-Bloc'
}

{ #category : 'instance creation' }
CMBlImageBackground class >> image: anImage extent: aPoint scale: aNumber folder: aFolder [
	"Return a background that shows anImage on an element of logical extent aPoint, drawn with aNumber pixels per point from the files of aFolder"

	^ self new
		  setImage: anImage
		  extent: aPoint
		  scale: aNumber
		  folder: aFolder
]

{ #category : 'drawing' }
CMBlImageBackground >> aeApplyTo: aeCanvas [

	aeCanvas
		setBackgroundWith: [
		aeCanvas privateAeCairoContext sourceSurface: surface ]
		alpha: self opacity
]

{ #category : 'drawing' }
CMBlImageBackground >> isTransparent [

	^ self opacity closeTo: 0
]

{ #category : 'drawing' }
CMBlImageBackground >> matchExtent: anExtent [
	"I am drawn for the extent I was made for. An element of another extent needs another background"

	
]

{ #category : 'initialization' }
CMBlImageBackground >> setImage: anImage extent: aPoint scale: aNumber folder: aFolder [

	| pixels |
	pixels := aPoint * aNumber.
	surface := AeCairoImageSurface extent: pixels ceiling.
	surface newContextDo: [ :context |
		anImage drawOn: context in: (0 @ 0 extent: pixels) folder: aFolder ].
	surface deviceScale: aNumber asPoint
]
