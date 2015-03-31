- displaying - obsolete
lineSegmentN
	
	^(self segments isNil or: [self orderedNeighbourhood size = 6])
		ifTrue: [nil]
		ifFalse: [self segments first]