connection
removeIncoming: anIncomingActivity
	
	self incoming
		remove: anIncomingActivity
		ifAbsent: [nil]