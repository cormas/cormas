+ environment - sensing - space
nearestLocationsVerifying: aBlock withinRadius: range
	"Purpose: returns the nearest spatial entities within a given radius of the current location and fulfilling the constraint specified in aBlock. 
The current location is NOT considered
Arguments: aBlock = <BlockClosure>
			range = <Integer>
Return value: <Collection(SpatialEntity) | nil>
Example: self nearestLocationsVerifying: [:c | c isClosed not] withinRadius: 5"
	
	^self patch isNil
		ifTrue: [nil]
		ifFalse:
			[self patch nearestNeighborsVerifying: aBlock withinRadius: range]