+ environment - distance
euclideanDistanceTo: aCell
	"Purpose: returns the distance between the receiver and a given spatial entity, using the Euclidean distance formula: 
	square root of [(Xa - Xb)^2 + (Ya - Yb)^2)]
Argument: aCell = <SpatialEntityElement>
Return value: <Number>"
	
	^self spaceModel euclideanDistanceFromCell: self toCell: aCell