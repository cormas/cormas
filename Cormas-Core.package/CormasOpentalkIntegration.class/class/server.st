api
server
	
	self isServerOn ifFalse: [self startServer].
	^server