+ environment - distance
euclideanDistanceTo: anotherSpatialEntity
	"Purpose: returns the distance between the receiver and another spatialEntity, using the Euclidean distance formula: 
	square root of [(Xa - Xb)^2 + (Ya - Yb)^2)]
Argument: anotherSpatialEntity = <SpatialEntity>"
	
	self subclassResponsibility