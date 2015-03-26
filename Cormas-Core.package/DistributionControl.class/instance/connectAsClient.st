actions
connectAsClient
	"act as a client. connect to the server"
	
	| ipServer ns |
	self brokerStarted ifFalse: [^Dialog warn: 'The broker is not started'].
	self isSameServerAndClient
		ifTrue:
			[^Dialog warn:
					'The server name and port cannot be both same as local. Change one of port or name.'].
	client := DistributedClient on: self.
	[ipServer := self serverIP.
	remoteBroker := broker activeBrokerAt: ipServer.
	ns := remoteBroker namingService.
	remoteDistribution := ns resolve: 'Cormas.distribution'.
	remoteDistribution addClient: client.
	self connected: true]
		on: Exception
		do:
			[:ex | 
			Dialog warn: 'Problem: ' , ex messageText.
			remoteBroker := remoteDistribution := nil]