+ environment - sensing - space
nearestCellsWithoutAny: locatedEntityName
	"Purpose: returns the nearest cells without any occupant of a given type.
Valid only for regular grids (square or hexagonal cells).  
Argument: locatedEntityName = <Symbol | Class>
Return value: <Collection(SpatialEntityElement)>
Example: self nearestCellsWithoutAny: #Predator"
	
	^self
		nearestNeighborsVerifying: [:p | p noOccupantType: locatedEntityName]
		withinRadius: (self spaceModel line max: self spaceModel column)