+ ways
stopArcs
	"Purpose: returns the arcs located at the end of the Network"
	
	^self arcs select: [:arc | arc isNetworkStopArc]