+ environment - sensing - space
locationsWithoutAny: locatedEntityName withinRadius: range
	"Purpose: returns the spatial entities in a given range without any occupant of a given type. 
The current location is considered
Arguments: 	locatedEntityName = <Symbol | Class>
			range = <Integer>
Return value: <Collection(SpatialEntity) | nil>
Example: self locationsWithoutAny: Predator withinRadius: self perceptionRangePredators"
	
	^self patch isNil
		ifTrue: [nil]
		ifFalse:
			[self patch recursiveNeighbourhood: range withoutAny: locatedEntityName]