actions
stopBroker
	
	self disconnect.
	broker
		ifNotNil:
			[broker stop.
			broker := nil].
	self updateWidgets