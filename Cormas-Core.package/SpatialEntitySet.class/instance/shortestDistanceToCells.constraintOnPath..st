+ environment - distance
shortestDistanceToCells: aCollecOfCells constraintOnPath: aBlock
	"Purpose: gets the shortest distance (in cell unit) to a collection of other cells, taking a specified constraint into account.
Arguments: aCollecOfCells = <Collection(SpatialEntityElement)>
			aBlock = <BlockClosure>
Return value: <Integer>
Example: self shortestDistanceToCells: self myPlots constraintOnPath: [:aCell | aCell isClosed not]"
	
	^self
		distanceTo:
			(self nearestCellFromCells: aCollecOfCells constraintOnPath: aBlock)