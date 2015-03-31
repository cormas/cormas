+ environment - distance
distanceTo: anotherCell constraintOnPath: aBlock
	"Purpose: returns the Manhattan distance (in cells) between the receiver and anotherSpatialEntity, taking a specified constraint into account.
Arguments: anotherCell = <SpatialEntityElement>
			aBlock = <BlockClosure>
Return value: <Integer>
Example: self distanceTo: self spaceModel centralLocation constraintOnPath: [:aCell | aCell isClosed not]"
	
	^(self wayTo: anotherCell constraint: aBlock) size - 1