xml-rpc
connectToExternalVisualizer
	"Connect to external visualizer (via XML-RPC)"
	
	Dialog warn: 'Exernal visualization under reconstruction'.
	self halt	"	xmlRpcClient := XmlRpcClient host: 'localhost' port: 10080 path: 'Visualizer'.
	xmlRpcClient perform: 'Visualizer.loadModel' with: self buildXmlRpcModelRepresentation."