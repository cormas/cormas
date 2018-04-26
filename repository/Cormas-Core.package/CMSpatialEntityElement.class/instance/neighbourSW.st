+ environment - sensing - space
neighbourSW
	"Purpose: returns the neighbour to the SouthWest
Not nil only for square (8 neighbors) and hexagonal cells (regular spatial grid). 
Return value: <SpatialEntityElement | nil>"
	
	self spaceModel nbNeighbours = #eight
		ifTrue: [^self orderedNeighbourhood at: 4].
	self spaceModel nbNeighbours = #six
		ifTrue: [^self orderedNeighbourhood at: 3].
	^nil