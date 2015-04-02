+ network
fullNetwork
	"returns an instance of NetworkEntity containing all the connected arcs of the network I belong to, as well as all the nodes"
	
	| network |
	network := NetworkEntity new.
	network arcs: (self fullNetworkWithout: IndexedSet new).
	network getNodes.
	^network