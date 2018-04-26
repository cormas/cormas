+ environment - sensing - space
nearestCellsVerifying: aCondition
	"Purpose: returns the nearest cells verifying a specified condition.
Valid only for regular grids (square or hexagonal cells). 
Argument: aCondition = <BlockClosure>
Return value: <Collection(SpatialEntityElement)>
Example: self nearestCellsVerifying: [:c | c isClosed not]"
	
	^self
		nearestNeighborsVerifying: aCondition
		withinRadius: (self spaceModel line max: self spaceModel column)