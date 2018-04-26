+ utilities - space metrics
dominance: anAttribute
	"Purpose: Return the Dominance-Index of SpatialEntityElements instances (theCells for example). The Dominance-Index is used as an index of biodiversity. It gives the information if there is one dominant category of cells in the spatial grid or if all categories have more or less the same relative proportions. Categories of cells are cells that have a different value of anAttribute (see the method nClasses: anAttribute).
Argument: anAttribute is the name of the attribute, ex #state
Return Value: Depending of the proportions the results range between 0 and 1.
Example: self dominance: #groupNumber"

	^ self spaceModel dominance: anAttribute