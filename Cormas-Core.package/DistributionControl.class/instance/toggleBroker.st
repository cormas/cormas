actions
toggleBroker
	
	self brokerStarted
		ifTrue: [self stopBroker]
		ifFalse: [self startBroker]