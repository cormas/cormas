+ moving
moveNcells: n towards: aCell constraintOnPath: aBlock
	"Purpose: moves n cells in direction of a given location, taking a specified constraint on each cell of the path to destination.
Argument: aCell = <SpatialEntityElement>
n = <positive Integer>
Example: self moveNcells: 3 towards: self house patch constraintOnPath: [:c | c isClosed not]"
	
	| path |
	self isSituated
		ifTrue:
			[self patch = aCell
				ifFalse:
					[path := self patch wayTo: aCell constraint: aBlock.
					path size < n
						ifTrue: [self moveTo: aCell]
						ifFalse: [self moveTo: (path at: n)]]]