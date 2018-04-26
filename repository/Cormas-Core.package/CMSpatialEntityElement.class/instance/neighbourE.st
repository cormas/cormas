+ environment - sensing - space
neighbourE
	"Purpose: returns the neighbour to the East
Not nil only for square and hexagonal cells (regular spatial grid). 
Return value: <SpatialEntityElement | nil>"
	
	self spaceModel nbNeighbours = #four
		ifTrue: [^self orderedNeighbourhood at: 4].
	self spaceModel nbNeighbours = #eight
		ifTrue: [^self orderedNeighbourhood at: 7].
	self spaceModel nbNeighbours = #six
		ifTrue: [^self orderedNeighbourhood at: 5].
	^nil