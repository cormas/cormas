procedures
refreshAfterStep
	
	self builder window isOpen
		and: [self refreshEachStep ifTrue: [self setNewHistoData]]