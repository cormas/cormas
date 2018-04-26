+ add-arc
newOutgoingArcToNode: endNode
	"creates and add a new instance of Arc from my stopNode to another node: endNode"
	
	| newArc |
	newArc := self newEntity: self class.
	newArc
		initFrom: self stopNode
		to: endNode