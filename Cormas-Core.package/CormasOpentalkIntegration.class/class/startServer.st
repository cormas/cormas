api
startServer
	"start the Opentalk server and share an entry in the naming service"
	"	server := Opentalk.RequestBroker newStstTcpAtPort: 4242."
	
	| ip |
	ip := IPSocketAddress
		hostName: SocketAccessor getHostname
		port: self defaultServerPort.	"POUR SPECIFIER L''IP DU SERVEUR -> hostName: '25.94.252.99'"
	server := RequestBroker newStstTcpAt: ip.
	server start.
	server openSelectors: server openSelectors , #(#namingService).
	server namingService create: 'Cormas'