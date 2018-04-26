star testing
belongsToCyclicWay
	"answers if the Node is part of a cyclic way of nodes"
	self isNetworkStartNode ifTrue:[^false].
	self isNetworkStopNode ifTrue:[^false].
	^self belongsToCyclicWay: OrderedCollection new