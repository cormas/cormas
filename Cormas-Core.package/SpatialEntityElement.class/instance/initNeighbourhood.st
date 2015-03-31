- initialize-release
initNeighbourhood
	
	self orderedNeighbourhood isNil ifTrue: [^nil].
	self neighbourhood: (self orderedNeighbourhood select: [:a | a notNil])