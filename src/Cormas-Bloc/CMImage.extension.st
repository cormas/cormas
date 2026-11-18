Extension { #name : 'CMImage' }

{ #category : '*Cormas-Bloc' }
CMImage >> areaIn: aRectangle [
	"Return the part of aRectangle where I am drawn: all of it when I cover it, otherwise a square of my size, both moved by my shift"

	| extent |
	extent := self coversTheCell
		          ifTrue: [ aRectangle extent ]
		          ifFalse: [ (self size * aRectangle extent min) asPoint ].
	^ Rectangle
		  center: aRectangle center + (self shift * aRectangle extent)
		  extent: extent
]

{ #category : '*Cormas-Bloc' }
CMImage >> drawContentOn: aContext in: aRectangle folder: aFolder [
	"Draw what I show in aRectangle, before my tint is laid over it"

	self subclassResponsibility
]

{ #category : '*Cormas-Bloc' }
CMImage >> drawOn: aContext in: aRectangle folder: aFolder [
	"Draw me with Cairo inside aRectangle: the pixels of a whole element, or of the combined image I am a layer of. My tint only colors my own pixels"

	aContext saveState.
	aContext
		rectangle: aRectangle;
		clip.
	aContext pushGroup.
	self
		drawContentOn: aContext
		in: (self areaIn: aRectangle)
		folder: aFolder.
	aContext
		operator: AeCairoOperator atop;
		sourceColor: self tint;
		paint.
	aContext
		popGroupToSource;
		paint.
	aContext restoreState
]
