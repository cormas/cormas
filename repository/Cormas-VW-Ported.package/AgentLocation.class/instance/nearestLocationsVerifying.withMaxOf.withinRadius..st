+ environment - sensing - space
nearestLocationsVerifying: aCondition withMaxOf: aMagnitudeName withinRadius: range
	"Purpose: returns the nearest spatial entities within a given radius of the current location with the maximum value of a given magnitude and verifying a specified condition . 
The current location is NOT considered
Arguments: aMagnitudeName = <ByteSymbol>
			aCondition = <BlockClosure>
			range = <Integer>
Return value: <Collection(SpatialEntity) | nil>
Example: self nearestLocationsWithMaxOf: #water verifying: [:c | c isPolluted not] withinRadius: 5"
	
	^self patch isNil
		ifTrue: [nil]
		ifFalse:
			[self patch nearestNeighborsVerifying: aCondition withMaxOf: aMagnitudeName
				withinRadius: range]