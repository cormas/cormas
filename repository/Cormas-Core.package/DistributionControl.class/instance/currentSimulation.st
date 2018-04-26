accessing
currentSimulation
	
	self distributedMode value == #client
		ifTrue: [^self clientRemoteSimulation].
	^Cormas current currentSimulation