+ utilities - space metrics
edgeDensity: aClass totalArea: aNumber
	"Purpose: Return the density of edges of an aggregate class instances as compared to the specified total size of the area.
Argument: aClass should be an aggregate. aNumber is the specified total area
Example: self edgeDensity: ForestAggregate totalArea: 7436"
	
	^self spaceModel edgeDensity: aClass totalArea: aNumber