+ initialize-release
initFrom: initNode to: endNode
	
	self startNode: initNode.
	self stopNode: endNode.
	self
		isMovedFrom: initNode patch
		to: endNode patch