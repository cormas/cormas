+ moving
moveTowards: aCell constraintOnPath: aBlock
	"Purpose: moves one cell in direction of a given location, taking a specified constraint on each cell of the path to destination.
Argument: aCell = <SpatialEntityElement>
Example: self moveTowards: self house patch constraintOnPath: [:c | c isClosed not]"
	
	self isSituated
		ifTrue:
			[self patch = aCell
				ifFalse:
					[self moveTo: (self patch wayTo: aCell constraint: aBlock) first]]