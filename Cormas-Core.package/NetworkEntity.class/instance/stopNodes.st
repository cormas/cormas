+ ways
stopNodes
	"Purpose: returns the nodes located at the end of the Network"
	
	^self stopArcs collect: [:arc | arc stopNode]