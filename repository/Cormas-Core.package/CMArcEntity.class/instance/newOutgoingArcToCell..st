+ add-arc
newOutgoingArcToCell: endCell
	"creates and add a new instance of Arc from my stopNode to another cell by creating a new instance of stopNode on endCell if there is none or using the current node if already located on endCell"
	
	| endNode endNodes |
	endNodes := endCell occupants: self nodeType name.
	endNodes isEmpty
		ifTrue:
			[endNode := self newNode.
			endNode isMovedTo: endCell]
		ifFalse: [endNode := endNodes first].
	self newOutgoingArcToNode: endNode