+ environment - sensing - space
nearestCellVerifying: aCondition withMaxOf: aMagnitudeName
	"Purpose: returns the nearest cell verifying a specified condition and with the highest value of a specified function. 
If none: returns nil; if more than one at the minimum radius: random selection
Valid only for regular grids (square or hexagonal cells).
Arguments: aCondition = <BlockClosure>
			aMagnitudeName = <ByteSymbol>
Return value: <SpatialEntityElement | nil>
Example: self nearestCellVerifying: [:c | c isPolluted not] withMaxOf: #water"
	
	| locations |
	locations := self nearestCellsVerifying: aCondition withMaxOf:
			aMagnitudeName.
	^locations isEmpty
		ifFalse: [Cormas selectRandomlyFrom: locations]
		ifTrue: [nil]