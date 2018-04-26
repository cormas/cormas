+ environment - distance
euclideanDistanceTo: aSpatialEntity
	"Purpose: returns the distance between the receiver and a given spatial entity, using the Euclidean distance formula : square root of [(Xa - Xb)^2 + (Ya - Yb)^2)]
Argument: aSpatialEntity = <SpatialEntity>
Return value: <Number>"
	
	| sortColl |
	sortColl := SortedCollection new.
	self components
		do:
			[:aComponent | sortColl add: (aComponent euclideanDistanceTo: aSpatialEntity)].
	^sortColl first