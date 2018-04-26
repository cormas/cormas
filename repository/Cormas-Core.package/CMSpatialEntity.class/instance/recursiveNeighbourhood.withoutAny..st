+ environment - sensing - space
recursiveNeighbourhood: range withoutAny: locatedEntityName
	"Purpose: returns the spatial entities within a given radius and without any occupant of a given type.
Arguments: range = <Integer>
			locatedEntityName = <Symbol | Class>
Return value: <Collection(SpatialEntity)>
Example: self recursiveNeighbourhood: 5 withoutAny: #Tree"
	
	^self
		recursiveNeighbourhood: range
		verifying: [:p | p noOccupantType: locatedEntityName]