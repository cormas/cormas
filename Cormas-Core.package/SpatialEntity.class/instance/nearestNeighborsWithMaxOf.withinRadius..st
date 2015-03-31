+ environment - sensing - space
nearestNeighborsWithMaxOf: aMagnitudeName withinRadius: range
	"Purpose: returns the nearest spatial entities within a given radius of the current location with the maximum value of a given magnitude. 
The current location is NOT considered
Arguments: aMagnitudeName = <ByteSymbol>
			range = <Integer>
Return value: <Collection(SpatialEntity)>
Example: self nearestNeighborsWithMaxOf: #water withinRadius: 5"
	
	^self
		nearestNeighborsVerifying: [:c | true]
		withMaxOf: aMagnitudeName
		withinRadius: range