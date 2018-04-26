+ add-arc
newIncomingArcFromCell: initCell
	"creates and add a new instance of Arc from initCell until my startNode. If there is no node on initCell, it creates it, otherwise it uses the current node  already located on initCell"
	
	| nodes initNode |
	nodes := initCell occupants: self nodeType name.
	nodes isEmpty
		ifTrue:
			[initNode := self newNode.
			initNode isMovedTo: initCell]
		ifFalse: [initNode := nodes first].
	self newIncomingArcFromNode: initNode