updating
computePreferredBounds
	
	| newExtent |
	newExtent := self model selectedActivity value asComposedText extent
		+ (10 @ 10).
	^self origin extent: newExtent