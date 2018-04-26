+accessing
startNode: aNode
	
	startNode isNil ifFalse: [self startNode removeArc: self].
	startNode := aNode.
	aNode arcs add: self.
	aNode changed	"self changed"