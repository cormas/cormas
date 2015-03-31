+ environment - picking - space
nearestNeighborVerifying: aBlock withinRadius: range
	"Purpose: returns the nearest spatial entity within a given radius and fulfilling a specified constraint. 
If none: returns nil; if more than one at the minimum radius: random selection
Arguments: range = <Integer>
			aBlock = <BlockClosure>
Return value: <SpatialEntity | nil>
Example: self nearestNeighborVerifying: [:c | c waterLevel < 2] withinRadius: 3 "
	
	| locations |
	locations := self nearestNeighborsVerifying: aBlock withinRadius: range.
	^locations isEmpty
		ifFalse: [Cormas selectRandomlyFrom: locations]
		ifTrue: [nil]