+ environment - picking - space
nearestNeighborWithoutAny: locatedEntityName withinRadius: range
	"Purpose: returns the nearest spatial entity in a given range without any occupant of a given type. 
If none: returns nil; if more than one at the minimum radius: random selection
Arguments: range = <Integer>
			locatedEntityName = <Symbol | Class>
Return value: <SpatialEntity | nil>
Example: self nearestNeighborWithoutAny: #Tree withinRadius: 3 "
	
	| locations |
	locations := self nearestNeighborsWithoutAny: locatedEntityName
		withinRadius: range.
	^locations isEmpty
		ifFalse: [Cormas selectRandomlyFrom: locations]
		ifTrue: [nil]