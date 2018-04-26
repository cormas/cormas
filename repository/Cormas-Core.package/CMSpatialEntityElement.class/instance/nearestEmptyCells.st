+ environment - sensing - space
nearestEmptyCells
	"Purpose: returns the nearest cell with no occupant of any kind.
Valid only for regular grids (square or hexagonal cells).  
Return value: <Collection(SpatialEntityElement)>"
	
	^self
		nearestEmptyNeighborsWithinRadius:
			(self spaceModel line max: self spaceModel column)