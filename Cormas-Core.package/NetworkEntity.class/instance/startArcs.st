+ ways
startArcs
	"Purpose: returns the arcs located at the start of the Network"
	
	^self arcs select: [:arc | arc isNetworkStartArc]