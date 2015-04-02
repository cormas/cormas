+ procedures
replaceStopNodeBy: anotherStopNode
	"change the previous endNode to another node: anotherEndNode.
Remove the old Node if it doesn't contains other arc"
	
	| oldStopNode |
	anotherStopNode = self stopNode ifTrue: [^nil].
	oldStopNode := self stopNode.
	self stopNode: anotherStopNode.
	self newStopPosition: anotherStopNode patch.
	oldStopNode isNil ifFalse: [oldStopNode removeArc: self]