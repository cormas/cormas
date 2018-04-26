+ network
fullNetworkType: aNetworkClass
	"returns an instance of aNetworkClass containing all the connected arcs of the network it belongs to, as well as all the nodes.
aNetworkClass is a subclass of NetworkEntity"
	
	| network |
	network := aNetworkClass new.
	network arcs: (self fullNetworkWithout: OrderedCollection new).
	network getNodes.
	^network