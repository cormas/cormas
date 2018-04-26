+ environment - sensing - space
neighbourhoodAndSelf
	"Purpose: returns the spatial entities belonging to the direct neighbourhood of the receiver
Also includes the receiver itself
self neighbourhoodAndSelf == self recursiveNeighbourhood: 1
Return value: <Collection(SpatialEntity)>"
	
	| collec |
	collec := self neighbourhood asOrderedCollection.
	collec addFirst: self.
	^collec