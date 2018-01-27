+ environment - sensing - space
nearestEmptyLocations
	"Purpose: returns the nearest spatial entities with no occupant of any kind.
The current location is NOT considered
Return value: <Collection(SpatialEntity) | nil>"
	
	^self patch isNil
		ifTrue: [nil]
		ifFalse: [self patch nearestEmptyCells]