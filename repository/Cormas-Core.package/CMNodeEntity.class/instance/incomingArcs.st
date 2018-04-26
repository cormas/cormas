+ accessing
incomingArcs
	"return a list of arcs for whom this node is an endNode"
	
	^self arcs select: [:arc | arc stopNode = self]