+ environment - picking - space
nearestLocationWithoutAny: locatedEntityName withinRadius: range
	"Purpose: returns the nearest spatial entity in a given range without any occupant of a given type. 
The current location is NOT considered
If none: returns nil; if more than one at the minimum radius: random selection
Arguments: 	locatedEntityName = <Symbol | Class>
			range = <Integer>
Return value: <SpatialEntity | nil>
Example: self nearestLocationWithoutAny: #Predator withinRadius: self perceptionRangePredators "
	
	^self patch isNil
		ifTrue: [nil]
		ifFalse:
			[self patch nearestNeighborWithoutAny: locatedEntityName withinRadius:
					range]