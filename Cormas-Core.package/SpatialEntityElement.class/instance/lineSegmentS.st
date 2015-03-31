- displaying - obsolete
lineSegmentS
	
	^(self segments isNil or: [self orderedNeighbourhood size = 6])
		ifTrue: [nil]
		ifFalse: [self segments at: 3]