- way
cyclicWays: previousWay
	"return a collection of cyclic ways that the Node belongs to"
	
	| nextWays nextWay previousWayMemory |
	self isNetworkStartNode ifTrue: [^#()].
	self isNetworkStopNode ifTrue: [^#()].
	(previousWay includes: self) ifTrue: [^previousWay].
	previousWay add: self.
	previousWayMemory := previousWay copy.
	nextWays := OrderedCollection new.
	self outgoingArcs
		do:
			[:arc | 
			nextWay := arc stopNode cyclicWays: previousWayMemory.
			nextWay isEmpty
				ifFalse:
					[nextWay first isCollection
						ifTrue: [nextWays addAll: nextWay]
						ifFalse: [nextWays add: nextWay].
					previousWayMemory := previousWay copy]].
	^nextWays