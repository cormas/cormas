+ environment - sensing - space
nearestCellVerifying: aCondition
	"Purpose: returns the nearest spatial entity verifying a specified condition 
If none: returns nil; if more than one at the minimum radius: random selection
Valid only for regular grids (square or hexagonal cells). For polygonal cells, use the generic but slower method #nearestCellVerifying: in super class SpatialEntity 
Argument: aCondition = <BlockClosure>
Return value: <SpatialEntity | nil>
Example: self nearestCellVerifying: [:c | c isClosed not]"
	
	^(self spaceModel gridCellShape = #squared
		or: [self spaceModel gridCellShape = #hexagonal])
		ifTrue:
			[self
				nearestNeighborVerifying: aCondition
				withinRadius: (self spaceModel line max: self spaceModel column)]
		ifFalse:
			[self
				nearestCellVerifying: aCondition
				constraintOnPath: [:aCell | true]]