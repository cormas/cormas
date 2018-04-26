+ environment - picking - space
nearestLocationVerifying: aBlock withinRadius: range
	"Purpose: returns the nearest spatial entity within a given radius of the current location and fulfilling the constraint specified in aBlock. 
The current location is NOT considered
If none: returns nil; if more than one at the minimum radius: random selection
Arguments: 	aBlock = <BlockClosure>
			range = <Integer>
Return value: <SpatialEntity | nil>
Example: self nearestLocationVerifying: [:c | c isClosed not] withinRadius: 5"
	
	^self patch isNil
		ifTrue: [nil]
		ifFalse:
			[self patch nearestNeighborVerifying: aBlock withinRadius: range]