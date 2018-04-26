+ moving
moveTowards: aCell
	"Purpose: moves one cell in direction of a given location.
Argument: aCell = <SpatialEntityElement>
Example: self moveTowards: self house patch"
	
	self isSituated
		ifTrue:
			[self patch = aCell ifFalse: [self moveTo: (self patch wayTo: aCell) first]]