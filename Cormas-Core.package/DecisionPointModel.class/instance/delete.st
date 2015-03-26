initialize-release
delete
	
	self outgoingTrue isNil ifFalse: [self outgoingTrue removeIncoming: self].
	self outgoingFalse isNil
		ifFalse: [self outgoingFalse removeOutgoing: self].
	super delete