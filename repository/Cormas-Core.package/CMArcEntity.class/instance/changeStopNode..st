+ add-arc
changeStopNode: anotherStopNode
	"change the previous endNode to another node: anotherEndNode.
Remove the old Node if it doesn't contains other arc"
	
	| oldStopNode |
	oldStopNode := self stopNode.
	self stopNode: anotherStopNode.
	self newStopPosition: anotherStopNode patch.
	oldStopNode removeArc: self