+ environment - sensing - space
neighboringLocations
	"Purpose: return direct neighbours of current location
The current location is NOT considered
Return value: <Collection(SpatialEntity) | nil>"
	
	^self patch isNil
		ifTrue: [nil]
		ifFalse: [self patch neighbourhood]