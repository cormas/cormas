+ environment - picking - space
nearestEmptyLocationWithinRadius: range
	"Purpose: returns the nearest spatial entity within a given radius of the current location and with no occupant of any kind. 
The current location is NOT considered
If none: returns nil; if more than one at the minimum radius: random selection
Argument: range = <Integer>
Return value: <SpatialEntity | nil>"
	
	^self patch isNil
		ifTrue: [nil]
		ifFalse: [self patch nearestEmptyNeighborWithinRadius: range]