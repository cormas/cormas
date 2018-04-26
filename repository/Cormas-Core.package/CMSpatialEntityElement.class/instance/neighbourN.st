+ environment - sensing - space
neighbourN
	"Purpose: returns the neighbour to the North
Not nil only for square cells (regular spatial grid). 
Return value: <SpatialEntityElement | nil>"
	
	self spaceModel nbNeighbours = #four
		| (self spaceModel nbNeighbours = #eight)
		ifTrue: [^self orderedNeighbourhood at: 1].
	^nil