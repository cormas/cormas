+ environment - sensing - space
nearestNeighborsVerifying: aCondition withMaxOf: aMagnitudeName withinRadius: range
	"Purpose: returns the nearest spatial entities within a given radius of the current location with the maximum value of a given magnitude and verifying a specified condition. 
The current location is NOT considered
Arguments: aMagnitudeName = <ByteSymbol>
			aCondition = <BlockClosure>
			range = <Integer>
Return value: <Collection(SpatialEntity)>
Example: self nearestNeighborsWithMaxOf: #water verifying: [:c | c isPolluted not] withinRadius: 5"
	
	| locations |
	locations := Cormas
		selectEntitiesWithMaxOf: aMagnitudeName
		amongEntities: (self recursiveNeighbourhood: range)
		verifying: aCondition.
	locations
		remove: self
		ifAbsent: [].
	locations := locations
		asSortedCollection: [:i :j | (i distanceTo: self) < (j distanceTo: self)].
	locations := locations
		select: [:c | (c distanceTo: self) = (locations first distanceTo: self)].
	^locations