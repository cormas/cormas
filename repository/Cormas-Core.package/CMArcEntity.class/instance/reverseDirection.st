+ procedures
reverseDirection
	"Reverse the direction of the arc (downstream -> upstream)"
	
	| oldStartNode oldStopNode |
	oldStartNode := self startNode.
	oldStopNode := self stopNode.
	self stopNode: oldStartNode.
	self startNode: oldStopNode.
	startNode changed.
	stopNode changed.
	self newStartPosition: self startNode patch.
	self patch: self startNode patch.
	self newStopPosition: self stopNode patch