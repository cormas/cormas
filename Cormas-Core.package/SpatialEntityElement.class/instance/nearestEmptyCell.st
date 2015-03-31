+ environment - sensing - space
nearestEmptyCell
	"Purpose: returns the nearest cell with no occupant of any kind. 
If none: returns nil; if more than one at the minimum radius: random selection
Valid only for regular grids (square or hexagonal cells). For polygonal cells, use the generic but slower method #nearestCellVerifying: in super class SpatialEntity 
Return value: <SpatialEntityElement | nil>"
	
	| locations |
	^(self spaceModel gridCellShape = #squared
		or: [self spaceModel gridCellShape = #hexagonal])
		ifTrue:
			[locations := self
				nearestEmptyNeighborsWithinRadius:
					(self spaceModel line max: self spaceModel column).
			locations isEmpty
				ifFalse: [Cormas selectRandomlyFrom: locations]
				ifTrue: [nil]]
		ifFalse: [super nearestCellVerifying: [:p | p noOccupant]]