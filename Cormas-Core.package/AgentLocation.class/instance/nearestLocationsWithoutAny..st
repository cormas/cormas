+ environment - sensing - space
nearestLocationsWithoutAny: locatedEntityName
	"Purpose: returns the nearest spatial entities without any occupant of a given type.
The current location is NOT considered
Arguments: locatedEntityName = <Symbol | Class>
Return value: <Collection(SpatialEntityElement) | nil>
Example: self nearestLocationsWithoutAny: #Predator"
	
	^self patch isNil
		ifTrue: [nil]
		ifFalse: [self patch nearestCellsWithoutAny: locatedEntityName]