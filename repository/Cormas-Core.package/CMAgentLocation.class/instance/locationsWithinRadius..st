+ environment - sensing - space
locationsWithinRadius: range
	"Purpose: returns a collection a cells within a given radius of the current position
The current location is considered
Argument: range = <Integer>
Return value: <Collection(SpatialEntity) | nil>"
	
	^self patch isNil
		ifTrue: [#()]
		ifFalse: [self patch recursiveNeighbourhood: range]