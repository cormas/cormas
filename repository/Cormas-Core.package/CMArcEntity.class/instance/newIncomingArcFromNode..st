+ add-arc
newIncomingArcFromNode: initNode
	"creates and add a new instance of Arc from initNode until my startNode"
	
	| newArc |
	newArc := self newEntity: self class.
	newArc
		initFrom: initNode
		to: self startNode