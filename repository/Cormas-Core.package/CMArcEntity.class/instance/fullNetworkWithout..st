- ways
fullNetworkWithout: rejectedNetworkSet
	"returns the main network. 
	rejectedCellsSet = <Set>
	! RECURSIVITY ! "
	
	| aMainNetwork allConnectedArcs |
	aMainNetwork := OrderedCollection with: self.
	allConnectedArcs := self incomingArcs.
	allConnectedArcs addAll: self outgoingArcs.
	allConnectedArcs := allConnectedArcs
		reject: [:arc | rejectedNetworkSet includes: arc].
	allConnectedArcs isEmpty ifTrue: [^aMainNetwork].
	allConnectedArcs
		do:
			[:arc | 
			rejectedNetworkSet add: self.
			aMainNetwork addAll: (arc fullNetworkWithout: rejectedNetworkSet)].
	^aMainNetwork