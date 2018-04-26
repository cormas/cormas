+ environment - distance
distanceTo: anotherSpatialEntity
	"Purpose: returns the Manhattan distance (in cells) between the receiver and anotherSpatialEntity
Argument: anotherSpatialEntity = <SpatialEntity>
Return value: <Integer>"
	
	anotherSpatialEntity isSpatialEntitySet
		ifTrue: [^anotherSpatialEntity distanceTo: self].
	^self spaceModel distanceFromCell: self toCell: anotherSpatialEntity