+ environment - sensing - space
neighboringLocationsVerifying: aBlock
	"Purpose: returns direct neighbours of current location fulfilling the constraint specified in aBlock. 
The current location is NOT considered
Argument: aBlock = <BlockClosure>
Return value: <Collection(SpatialEntity) | nil>
Example: self neighboringLocationsVerifying: [:c | c isClosed not]"
	
	^self patch isNil
		ifTrue: [nil]
		ifFalse: [self patch neighbourhood select: [:c | aBlock value: c]]