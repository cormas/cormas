+ environment - distance
distanceTo: aSpatialEntity
	"Purpose: returns the Manhattan distance (in cells) between the receiver and aSpatialEntity
Argument: aSpatialEntity = <SpatialEntity>
Return value: <Integer>"
	
	| sortColl |
	sortColl := SortedCollection new.
	self components
		do: [:aComponent | sortColl add: (aComponent distanceTo: aSpatialEntity)].
	^sortColl first