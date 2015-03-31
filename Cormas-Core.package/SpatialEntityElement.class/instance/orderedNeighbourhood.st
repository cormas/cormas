- accessing
orderedNeighbourhood
	
	orderedNeighbourhood ifNil: [self spaceModel initNeighbourhood].
	^orderedNeighbourhood