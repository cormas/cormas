+ procedures
replaceStartNodeBy: anotherStartNode
	"change the previous endNode to another node: anotherEndNode.
Remove the old Node if it doesn't contains other arc"
	
	| oldStartNode |
	anotherStartNode = self startNode ifTrue: [^nil].
	anotherStartNode patch ifNil: [^nil].
	oldStartNode := self startNode.
	self startNode: anotherStartNode.
	self newStartPosition: anotherStartNode patch.
	oldStartNode isNil ifFalse: [oldStartNode removeArc: self]