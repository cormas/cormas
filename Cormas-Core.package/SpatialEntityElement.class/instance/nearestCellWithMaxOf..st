+ environment - sensing - space
nearestCellWithMaxOf: aMagnitudeName
	"Purpose: returns the nearest cell with the highest value of a specified function. 
If none: returns nil; if more than one at the minimum radius: random selection
Valid only for regular grids (square or hexagonal cells).
Argument: aMagnitudeName = <ByteSymbol>
Return value: <SpatialEntityElement | nil>
Example: self nearestCellWithMaxOf: #sugar"
	
	| locations |
	locations := self nearestCellsWithMaxOf: aMagnitudeName.
	^locations isEmpty
		ifFalse: [Cormas selectRandomlyFrom: locations]
		ifTrue: [nil]