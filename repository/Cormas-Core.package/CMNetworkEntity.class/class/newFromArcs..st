instance creation
newFromArcs: arcsCollection
	"returns an instance of NetworkEntity containing all the connected arcs of the network of arcsCollection (all starting as the same location), as well as all the nodes"
	
	| network |
	network := self new.
	arcsCollection isEmpty ifTrue: [^network].
	network arcs: (arcsCollection first fullNetworkWithout: OrderedCollection new).
	arcsCollection removeFirst.
	arcsCollection
		do: [:a | network arcs addAll: (a fullNetworkWithout: OrderedCollection new)].
	^network