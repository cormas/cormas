+ environment - picking - space
nearestLocationWithoutAny: locatedEntityName
	"Purpose: returns the nearest spatial entity without any occupant of a given type.
The current location is NOT considered
If none: returns nil; if more than one at the minimum radius: random selection
Arguments: locatedEntityName = <Symbol | Class>
Return value: <SpatialEntityElement | nil>
Example: self nearestLocationWithoutAny: #Predator"
	
	^self patch isNil
		ifTrue: [nil]
		ifFalse: [self patch nearestCellWithoutAny: locatedEntityName]