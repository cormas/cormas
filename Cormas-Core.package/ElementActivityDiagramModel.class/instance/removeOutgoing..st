connection
removeOutgoing: anOutgoingActivity
	
	self outgoing
		remove: anOutgoingActivity
		ifAbsent: [nil]