+ environment - sensing - space
locationsVerifying: aBlock withinRadius: range
	"Purpose: returns the spatial entities within a given radius of the receiver current location and verifying the condition specified in aBlock. 
The current location is considered
Arguments: 	aBlock = <BlockClosure>
			range = <Integer>
Return value: <Collection(SpatialEntity) | nil>
Example: self locationsVerifying: [:c | c isClosed not] withinRadius: 5"
	
	^self patch isNil
		ifTrue: [nil]
		ifFalse: [self patch recursiveNeighbourhood: range verifying: aBlock]