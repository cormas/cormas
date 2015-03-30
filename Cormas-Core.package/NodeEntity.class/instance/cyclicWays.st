+ network
cyclicWays
	"return a collection of cyclic ways that the Node belongs to. Each cyclic way is an ordered collection of nodes, starting with the receiver node.
	An empty collection means that the node doesn't belong to any cyclic way. But one node may belong to several cyclic ways"
	
	| ways |
	self isNetworkStartNode ifTrue: [^#()].
	self isNetworkStopNode ifTrue: [^#()].
	ways := self cyclicWays: OrderedCollection new.
	ways removeAllSuchThat: [:w | (w last outgoingNodes includes: self) not].
	^ways