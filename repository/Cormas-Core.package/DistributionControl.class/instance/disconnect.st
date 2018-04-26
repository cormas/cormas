actions
disconnect
	
	remoteDistribution
		ifNotNil:
			[:dist | 
			[dist removeClient: client]
				on: Exception
				do: [:ex | Dialog warn: 'The server is not responding']].
	remoteBroker := remoteDistribution := nil.
	self connected: false.
	clientSpaceModel changed: #closeRequest.
	currentSimulation := nil.
	clientSpaceModel := nil