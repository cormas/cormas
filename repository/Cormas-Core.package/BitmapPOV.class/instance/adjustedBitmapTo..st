adjust
adjustedBitmapTo: aRectangle
	"return a positive Integer if aWindowSize > (sizeRatio * self preferredBounds) otherwise a negative Integer"
	
	| aPoint v |
	"aPoint := aWindowSize extent / self rMax."
	aPoint := aRectangle extent / self bounds extent.
	v := aPoint x min: aPoint y.
	^v	"rounded"