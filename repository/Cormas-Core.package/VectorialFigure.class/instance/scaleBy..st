transforming
scaleBy: aScaleFactor
	"Answer a new object scaled by the argument amount, which can be
	a Point or a scalar value."
	
	| scaledPolyline |
	scaledPolyline := self asGeometric scaledBy: aScaleFactor.
	self points: (scaledPolyline vertices collect: [:each | each rounded]).
	self recomputePreferredBounds