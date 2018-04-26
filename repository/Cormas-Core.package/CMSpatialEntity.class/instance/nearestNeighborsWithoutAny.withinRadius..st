+ environment - sensing - space
nearestNeighborsWithoutAny: locatedEntityName withinRadius: range
	"Purpose: returns the nearest spatial entities within a given radius and without any occupant of a given type.
Arguments: range = <Integer>
			locatedEntityName = <Symbol | Class>
Return value: <Collection(SpatialEntity)>
Example: self nearestNeighborsWithoutAny: #Tree withinRadius: 5 "
	
	^self
		nearestNeighborsVerifying: [:p | p noOccupantType: locatedEntityName]
		withinRadius: range