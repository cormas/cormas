instance creation
newFromArc: anArc
	"returns an instance of NetworkEntity containing all the connected arcs of the network of anArc, as well as all the nodes"
	
	| network |
	network := self new.
	network arcs: (anArc fullNetworkWithout: OrderedCollection new).
	^network