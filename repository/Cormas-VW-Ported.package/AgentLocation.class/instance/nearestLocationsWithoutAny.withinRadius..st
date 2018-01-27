+ environment - sensing - space
nearestLocationsWithoutAny: locatedEntityName withinRadius: range
	"Purpose: returns the nearest spatial entity in a given range without any occupant of a given type. 
The current location is NOT considered
Arguments: 	locatedEntityName = <Symbol | Class>
			range = <Integer>
Return value: <Collection(SpatialEntity) | nil>
Example: self nearestLocationsWithoutAny: #Predator withinRadius: self perceptionRangePredators "
	
	^self patch isNil
		ifTrue: [nil]
		ifFalse:
			[self patch nearestNeighborsWithoutAny: locatedEntityName withinRadius:
					range]