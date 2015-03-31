+ environment - picking - space
nearestNeighborVerifying: aBlock withMaxOf: aMagnitudeName withinRadius: range
	"Purpose: returns the nearest spatial entity verifying a specified condition with the higest value of a given function in a given radius. 
The current location is NOT considered
If none: returns nil; if more than one with the highest value at the minimum radius: random selection
Arguments: aBlock = <BlockClosure>
			aMagnitudeName = <ByteSymbol>
			range = <Integer>
Return value: <SpatialEntity | nil>
Example: self nearestNeighborVerifying: [:c | c isPolluted not] withMaxOf: #water withinRadius: 3 "
	
	| locations |
	locations := self nearestNeighborsVerifying: aBlock withMaxOf:
			aMagnitudeName withinRadius: range.
	^locations isEmpty
		ifFalse: [Cormas selectRandomlyFrom: locations]
		ifTrue: [nil]