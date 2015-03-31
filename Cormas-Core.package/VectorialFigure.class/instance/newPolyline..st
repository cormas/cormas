transforming
newPolyline: aPolyline
	
	| oldBounds |
	oldBounds := self preferredBounds.
	self removePoints.
	self points: aPolyline vertices self recomputePreferredBounds.	"1 to: aPolyline vertices size
		do: [:i | self addPoint: (aPolyline vertices at: i)]."
	self changedPreferredBounds: oldBounds.
	self changed