- deprecated
shortestDistanceTo: anotherCell constraintOnPath: aBlock
	"DEPRECATED. Should use: distanceTo: anotherCell constraintOnPath: aBlock

Purpose: gets the shortest distance (in cell unit) to anotherCell, taking a specified constraint into account.
Arguments: anotherCell = <SpatialEntityElement>
			aBlock = <BlockClosure>
Return value: <Integer>
Example: self shortestDistanceTo: self spaceModel centralLocation constraintOnPath: [:aCell | aCell isClosed not]"
	
	^(self wayTo: anotherCell constraint: aBlock) size - 1