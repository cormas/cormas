+ utilities - space metrics
patchDensity: aClass
	"Purpose: Return the density of instances of an aggregate class as compared to the total size of the spatial grid (total size of aggregates / grid size).
Argument: aClass should be an aggregate.
Example: self patchDensity: ForestAggregate"

	^ self spaceModel patchDensity: aClass