private accessing
clientRemoteSimulation
	
	^currentSimulation
		ifNil: [currentSimulation := remoteDistribution currentSimulation]