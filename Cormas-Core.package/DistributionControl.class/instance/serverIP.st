accessing
serverIP
	
	^IPSocketAddress
		hostName: self serverNameOrIP value
		port: self serverPort value asNumber