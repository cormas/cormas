+ network
fullNetworkType: aNetworkClass
	"returns an instance of aNetworkClass containing all the connected arcs of the network it belongs to, as well as all the nodes.
aNetworkClass is a subclass of NetworkEntity"
	
	^aNetworkClass newFromNode: self