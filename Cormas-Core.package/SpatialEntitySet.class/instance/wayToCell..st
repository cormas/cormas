- environment - sensing - space
wayToCell: aCell
	"Purpose: returns one of the shortest paths to aCell
Argument: aCell = <SpatialEntityElement>
Return value: <Collection(SpatialEntityElement)>
Example: self wayTo: self spaceModel centralLocation"
	
	| path path2 |
	path := self surround first wayTo: aCell.
	self surround
		do:
			[:c | 
			path2 := c wayTo: aCell.
			path2 size < path ifTrue: [path := path2]].
	^path