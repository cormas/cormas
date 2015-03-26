+ environment - sensing - space
nearestLocationsWithMaxOf: aMagnitudeName withinRadius: range
	"Purpose: returns the nearest spatial entities within a given radius of the current location with the maximum value of a given magnitude. 
The current location is NOT considered
Arguments: aMagnitudeName = <ByteSymbol>
			range = <Integer>
Return value: <Collection(SpatialEntity) | nil>
Example: self nearestLocationsWithMaxOf: #water verifying: [:c | c isPolluted not] withinRadius: 5"
	
	^self patch isNil
		ifTrue: [nil]
		ifFalse:
			[self patch nearestNeighborsWithMaxOf: aMagnitudeName withinRadius: range]