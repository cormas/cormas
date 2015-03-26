actions
toggleConnection
	
	self connected
		ifTrue: [self disconnect]
		ifFalse: [self connect]