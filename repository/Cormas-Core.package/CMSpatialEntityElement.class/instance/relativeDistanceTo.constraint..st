- deprecated
relativeDistanceTo: anotherCell constraint: aBlock
	"DEPRECATED. Should use: distanceTo: anotherCell constraintOnPath: aBlock
Return an integer : the distance (in cell unit) to anotherCell according to constraint  (aBlock)."
	
	^self shortestDistanceTo: anotherCell constraintOnPath: aBlock