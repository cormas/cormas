+ utilities - space metrics
nbDistinctValuesOf: anAttribute
	"Purpose: Return the number of SpatialEntityElements instances (theCells for example) that have a different value for anAttribute.
Argument: anAttribute is a symbol
Example: self nClasses: #state"

	^ self spaceModel nbDistinctValuesOf: anAttribute