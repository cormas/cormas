api
stopServer
	"stop the Opentalk server
	self stopServer
	"
	
	[server stop] ensure: [server := nil]