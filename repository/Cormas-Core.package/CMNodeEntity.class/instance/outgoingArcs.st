+ accessing
outgoingArcs
	"return a list of arcs for whom this node is a startNode"
	
	^self arcs select: [:arc | arc startNode = self]