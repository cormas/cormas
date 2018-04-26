+ environment - picking - space
nearestLocationVerifying: aBlock
	"Purpose: returns the nearest spatial entity fulfilling the constraint specified in aBlock. 
The current location is NOT considered
If none: returns nil; if more than one at the minimum radius: random selection
Return value: <SpatialEntity | nil>
Example: self nearestLocationVerifying: [:c | c isClosed not]"
	
	^self patch isNil
		ifTrue: [nil]
		ifFalse: [self patch nearestCellVerifying: aBlock]