+ environment - sensing - space
neighbourW
	"Purpose: returns the neighbour to the West
Not nil only for square and hexagonal cells (regular spatial grid). 
Return value: <SpatialEntityElement | nil>"
	
	self spaceModel nbNeighbours = #four
		ifTrue: [^self orderedNeighbourhood at: 2].
	self spaceModel nbNeighbours = #eight
		ifTrue: [^self orderedNeighbourhood at: 3].
	self spaceModel nbNeighbours = #six
		ifTrue: [^self orderedNeighbourhood at: 2].
	^nil