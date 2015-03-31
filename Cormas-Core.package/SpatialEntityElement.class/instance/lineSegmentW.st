- displaying - obsolete
lineSegmentW
	
	self segments isNil ifTrue: [^nil].
	^self orderedNeighbourhood size = 6
		ifTrue: [self segments at: 5]
		ifFalse: [self segments last]