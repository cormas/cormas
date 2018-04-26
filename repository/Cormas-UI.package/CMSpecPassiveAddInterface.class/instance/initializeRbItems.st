initialization
initializeRbItems
	" Private - Initialize radio button items "

	self rbTypeGroup buttonObject
		label: self translator tObject;
		help: self translator tObjectHelp.
		
	self rbTypeGroup buttonLocatedObject
		label: self translator tLocatedObject;
		help: self translator tLocatedObjectHelp.
		
	self rbTypeGroup buttonNetworkNode
		label: self translator tNetworkNode;
		help: self translator tNetworkNodeHelp.
		
	self rbTypeGroup buttonNetworkArc
		label: self translator tNetworkArc;
		help: self translator tNetworkArcHelp.
		
	self rbTypeGroup buttonFullNetwork
		label: self translator tFullNetwork;
		help: self translator tFullNetworkHelp.
		
	self rbTypeGroup buttonMessage
		label: self translator tMessage;
		help: self translator tMessageHelp