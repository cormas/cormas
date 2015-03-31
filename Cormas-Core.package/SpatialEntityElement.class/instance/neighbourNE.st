+ environment - sensing - space
neighbourNE
	"Purpose: returns the neighbour to the NorthEast
Not nil only for square (8 neighbors) and hexagonal cells (regular spatial grid). 
Return value: <SpatialEntityElement | nil>"
	
	self spaceModel nbNeighbours = #eight
		ifTrue: [^self orderedNeighbourhood at: 8].
	self spaceModel nbNeighbours = #six
		ifTrue: [^self orderedNeighbourhood at: 6].
	^nil