+ ways
startNodes
	"Purpose: returns the nodes located at the start of the Network"
	
	^self startArcs collect: [:arc | arc startNode]