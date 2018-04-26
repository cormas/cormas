xml-rpc
sendLeaveToExternalVisualizerOf: anAgent from: srcCell
	
	xmlRpcClient
		perform: 'Visualizer.display'
		with: (self buildDisplayXmlRepOfAgentLeftOf: anAgent from: srcCell)