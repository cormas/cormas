+ environment - picking - space
nearestNeighborWithMaxOf: aMagnitudeName withinRadius: range
	"Purpose: returns the nearest spatial entity with the higest value of a given function in a given radius. 
The current location is NOT considered
If none: returns nil; if more than one with the highest value at the minimum radius: random selection
Arguments: aMagnitudeName = <ByteSymbol>
			range = <Integer>
Return value: <SpatialEntity | nil>
Example: self nearestNeighborWithMaxOf: #biomass withinRadius: 3 "
	
	| locations |
	locations := self nearestNeighborsWithMaxOf: aMagnitudeName withinRadius:
			range.
	^locations isEmpty
		ifFalse: [Cormas selectRandomlyFrom: locations]
		ifTrue: [nil]