remoting
isDistributed
	
	^distributionControl isNil
		ifTrue: [false]
		ifFalse: [distributionControl brokerStarted]