accessing
brokerIP
	
	^IPSocketAddress
		hostName: self brokerNameOrIP value
		port: self brokerPort value asNumber