+ environment - sensing - space
nearestCellWithoutAny: locatedEntityName
	"Purpose: returns the nearest cell without any occupant of a given type. 
If none: returns nil; if more than one at the minimum radius: random selection
Valid only for regular grids (square or hexagonal cells). For polygonal cells, use the generic but slower method #nearestCellVerifying: in super class SpatialEntity 
Argument: locatedEntityName = <Symbol | Class>
Return value: <SpatialEntityElement | nil>
Example: self nearestCellWithoutAny: #Tree"
	
	| locations |
	^(self spaceModel gridCellShape = #squared
		or: [self spaceModel gridCellShape = #hexagonal])
		ifTrue:
			[locations := self nearestCellsWithoutAny: locatedEntityName.
			locations isEmpty
				ifFalse: [Cormas selectRandomlyFrom: locations]
				ifTrue: [nil]]
		ifFalse:
			[super nearestCellVerifying: [:p | p noOccupantType: locatedEntityName]]