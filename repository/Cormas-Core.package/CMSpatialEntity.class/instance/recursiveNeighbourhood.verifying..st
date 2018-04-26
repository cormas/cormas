+ environment - sensing - space
recursiveNeighbourhood: range verifying: aBlock
	"Purpose: returns the spatial entities within a given radius and fulfilling the constraint specified in aBlock. 
Arguments: range = <Integer>
			aBlock = <BlockClosure>
Return value: <Collection(SpatialEntity)>
Example: self recursiveNeighbourhood: 5 verifying: [:c | c isClosed not] "
	
	^(self recursiveNeighbourhood: range) select: [:p | aBlock value: p]