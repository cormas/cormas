+ environment - sensing - space
layerOfRadius: radius
	"Purpose: returns the spatial entities belonging to the appropriate layer.of recursive neighbourhood
Argument: radius = <Integer>
Return value: <Collection(SpatialEntity)>"
	
	^(self allLayersTo: radius) last