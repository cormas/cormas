+ utilities - space metrics
edgeDensity: aClass
	"Purpose: Return the density of edges of an aggregate class instances as compared to the total size of the spatial grid.
Argument: aClass should be an aggregate.
Example: self edgeDensity: ForestAggregate"
	
	^self spaceModel edgeDensity: aClass