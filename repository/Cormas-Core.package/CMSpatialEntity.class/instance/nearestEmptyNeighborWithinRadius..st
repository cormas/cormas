+ environment - picking - space
nearestEmptyNeighborWithinRadius: range
	"Purpose: returns the nearest spatial entity within a given radius and with no occupant of any kind. 
If none: returns nil; if more than one at the minimum radius: random selection
Argument: range = <Integer>
Return value: <SpatialEntity | nil>"
	
	| locations |
	locations := self nearestEmptyNeighborsWithinRadius: range.
	^locations isEmpty
		ifFalse: [Cormas selectRandomlyFrom: locations]
		ifTrue: [nil]