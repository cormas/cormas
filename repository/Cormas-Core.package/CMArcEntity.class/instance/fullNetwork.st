+ network
fullNetwork
	"returns an instance of NetworkEntity containing all the connected arcs of the network I belong to, as well as all the nodes"
	
	| network |
	network := CMNetworkEntity new.
	network arcs: (self fullNetworkWithout: OrderedCollection new).
	network getNodes.
	^network