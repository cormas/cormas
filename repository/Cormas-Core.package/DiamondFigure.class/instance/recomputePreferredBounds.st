updating
recomputePreferredBounds
	
	| scaleFactor scaledPolyline |
	self points isEmpty ifTrue: [^self bounds].
	scaleFactor := (100
		min:
			(self model selectedActivity value asComposedText extent + (10 @ 10)) x)
		/ self bounds extent x max: 0.2.
	scaledPolyline := self asGeometric scaledBy: scaleFactor.
	scaledPolyline := scaledPolyline
		translatedBy: 1 * (self bounds center - scaledPolyline bounds center).
	self points: scaledPolyline vertices.
	^super recomputePreferredBounds