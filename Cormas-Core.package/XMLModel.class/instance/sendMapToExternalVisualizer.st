xml-rpc
sendMapToExternalVisualizer
	"Send the map to the external visualizer"
	
	xmlRpcClient
		perform: 'Visualizer.display'
		with: self buildDisplayMapXmlRpcRepresentation