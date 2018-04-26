+ environment - sensing - space
nearestEmptyLocationsWithinRadius: range
	"Purpose: returns the nearest spatial entities with no occupant of any kind and within a given radius of the current location.
The current location is NOT considered
Argument: range = <Integer>
Return value: <Collection(SpatialEntity) | nil>"
	
	^self patch isNil
		ifTrue: [nil]
		ifFalse: [self patch nearestEmptyNeighborsWithinRadius: range]