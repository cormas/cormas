+ add-arc
changeStartNode: anotherStartNode
	"change the previous endNode to another node: anotherEndNode.
Remove the old Node if it doesn't contains other arc"
	
	| oldStartNode |
	anotherStartNode patch ifNil: [^nil].
	oldStartNode := self startNode.
	self startNode: anotherStartNode.
	self newStartPosition: anotherStartNode patch.
	oldStartNode removeArc: self