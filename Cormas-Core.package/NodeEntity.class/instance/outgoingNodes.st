+ accessing
outgoingNodes
	"return a list of nodes for whom this node is a startNode"
	
	^self outgoingArcs collect: [:arc | arc stopNode]