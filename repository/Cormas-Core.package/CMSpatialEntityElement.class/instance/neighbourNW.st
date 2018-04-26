+ environment - sensing - space
neighbourNW
	"Purpose: returns the neighbour to the NorthWest
Not nil only for square (8 neighbors) and hexagonal cells (regular spatial grid). 
Return value: <SpatialEntityElement | nil>"
	
	self spaceModel nbNeighbours = #eight
		ifTrue: [^self orderedNeighbourhood at: 2].
	self spaceModel nbNeighbours = #six
		ifTrue: [^self orderedNeighbourhood at: 1].
	^nil