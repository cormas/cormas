+ environment - sensing - space
nearestLocationsVerifying: aBlock
	"Purpose: returns the nearest spatial entities fulfilling the constraint specified in aBlock.
The current location is NOT considered
Return value: <Collection(SpatialEntity) | nil>
Example: self nearestLocationsVerifying: [:c | c isClosed not]"
	
	^self patch isNil
		ifTrue: [nil]
		ifFalse: [self patch nearestCellsVerifying: aBlock]