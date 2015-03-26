converting
renderDithered: im
	
	| medium gc |
	medium := im paintBasis retainedMediumWithExtent: im extent.
	gc := medium graphicsContext.
	gc paintPolicy: gc paintPolicy copy.
	gc paintPolicy imageRenderer: OrderedDither new.
	gc
		copyImage: im
		to: Point zero.
	^medium