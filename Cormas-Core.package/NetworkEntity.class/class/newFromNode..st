instance creation
newFromNode: aNode
	"returns an instance of NetworkEntity containing all the connected arcs of the network of anArc, as well as all the nodes"
	
	| network |
	aNode arcs isEmpty
		ifTrue:
			[network := self new.
			network nodes add: aNode.
			^network].
	^self newFromArcs: aNode arcs copy