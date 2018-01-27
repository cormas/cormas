+ moving
moveNcells: n towards: aCell
	"Purpose: moves n cells in direction of a given location.
Argument: aCell = <SpatialEntityElement>
n = <positive Integer>
Example: self moveNcells: 5 towards: self house patch"
	
	| path |
	self isSituated
		ifTrue:
			[self patch = aCell
				ifFalse:
					[path := self patch wayTo: aCell.
					path size < n
						ifTrue: [self moveTo: aCell]
						ifFalse: [self moveTo: (path at: n)]]]