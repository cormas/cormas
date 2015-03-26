actions
startBroker
	
	| ip |
	self brokerStarted
		ifTrue: [^self error: 'Internal problem : a broker is already started'].
	ip := self brokerIP.
	[broker := RequestBroker newStstTcpAt: ip.
	broker start.
	broker openSelectors: broker openSelectors , #(#namingService).
	(broker namingService)
		create: 'Cormas';
		rebind: 'Cormas.distribution' to: self.
	Transcript
		cr;
		print: broker.
	self updateWidgets]
		on: Exception
		do:
			[:ex | 
			Dialog warn: 'Problem: ' , ex messageText.
			broker := nil]