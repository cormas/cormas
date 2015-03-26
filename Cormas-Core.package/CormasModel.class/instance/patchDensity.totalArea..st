+ utilities - space metrics
patchDensity: aClass totalArea: aNumber
	"Purpose: Return the density of instances of an aggregate class as compared to the total specified total area.
Argument: aClass should be an aggregate.
aNumber is the specified total area
Example: self patchDensity: ForestAggregate totalArea: 4875"
	
	^self spaceModel patchDensity: aClass totalArea: aNumber