+ environment - sensing - space
neighbourS
	"Purpose: returns the neighbour to the South
Not nil only fore square cells (regular spatial grid). 
Return value: <SpatialEntityElement | nil>"
	
	self spaceModel nbNeighbours = #four
		ifTrue: [^self orderedNeighbourhood at: 3].
	self spaceModel nbNeighbours = #eight
		ifTrue: [^self orderedNeighbourhood at: 5].
	^nil