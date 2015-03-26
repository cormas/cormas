accessing
removeClient: aClient
	
	self clients list
		remove: aClient
		ifAbsent: []