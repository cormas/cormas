- way
belongsToCyclicWay: previousWay
	"answers if the Node is part of a cyclic way of nodes.
	Recursivity"

	self isNetworkStartNode
		ifTrue: [ ^ false ].
	self isNetworkStopNode
		ifTrue: [ ^ false ].
	(previousWay includes: self)
		ifTrue: [ ^ true ].
	^ self outgoingArcs
		anySatisfy: [ :arc | 
			previousWay add: self.
			arc stopNode belongsToCyclicWay: previousWay ]