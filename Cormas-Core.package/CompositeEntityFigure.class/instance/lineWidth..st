attribute accessing
lineWidth: anInteger
	"| set |
	set := Set new. 
	self components do:[:c| set addAll: c points].
	StrokingWrapper on: (Polyline vertices: set)."
	
	self attributes lineWidth: anInteger.
	self recomputePreferredBounds