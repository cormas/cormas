+accessing
stopNode: aNode
	
	stopNode isNil ifFalse: [self stopNode removeArc: self].
	stopNode := aNode.
	aNode arcs add: self