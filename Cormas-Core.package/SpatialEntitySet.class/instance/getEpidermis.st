+ accessing
getEpidermis
	"Purpose: returns the components belonging to the inner perimeter, i.e. components of the receiver with at least one neighbour not component of the receiver
Return value: <Collection(SpatialEntity)>"
	
	^self getSkins first