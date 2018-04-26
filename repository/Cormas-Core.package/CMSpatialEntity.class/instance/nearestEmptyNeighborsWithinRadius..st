+ environment - sensing - space
nearestEmptyNeighborsWithinRadius: range
	"Purpose: returns the nearest spatial entities within a given radius and with no occupant of any kind.
Argument: range = <Integer>
Return value: <Collection(SpatialEntity)>"
	
	^self
		nearestNeighborsVerifying: [:n | n noOccupant]
		withinRadius: range