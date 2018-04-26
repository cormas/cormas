networking
initClientIPSocketAddress: anIPSocketAddress
	"start a client on this host at any port communicating with the serveur on anIPSocketAddress"
	
	openTalkClient := RequestBroker
		newStstTcpAt: IPSocketAddress thisHostAnyPort.
	openTalkClient start.
	self resolveIPSocketAddress: anIPSocketAddress