+ accessing
incomingNodes
	"return a list of nodes for whom this node is a endNode"
	
	^self incomingArcs collect: [:arc | arc startNode]