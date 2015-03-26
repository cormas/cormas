+ environment - picking - space
nearestEmptyLocation
	"Purpose: returns the nearest spatial entity with no occupant of any kind. 
The current location is NOT considered
If none: returns nil; if more than one at the minimum radius: random selection
Return value: <SpatialEntity | nil>"
	
	^self patch isNil
		ifTrue: [nil]
		ifFalse: [self patch nearestEmptyCell]