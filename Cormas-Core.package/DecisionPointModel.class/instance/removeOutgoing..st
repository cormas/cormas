connection
removeOutgoing: anOutgoingActivity
	
	self outgoingTrue = anOutgoingActivity ifTrue: [self outgoingTrue: nil].
	self outgoingFalse = anOutgoingActivity ifTrue: [self outgoingFalse: nil]