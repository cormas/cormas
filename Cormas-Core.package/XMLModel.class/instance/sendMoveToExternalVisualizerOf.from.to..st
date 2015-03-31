xml-rpc
sendMoveToExternalVisualizerOf: anAgent from: srcCell to: dstCell
	
	xmlRpcClient
		perform: 'Visualizer.display'
		with:
			(self buildDisplayXmlRepOfAgentMoveOf: anAgent from: srcCell to: dstCell)