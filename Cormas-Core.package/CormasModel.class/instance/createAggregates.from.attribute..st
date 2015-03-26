+ instance creation - spatial entities
createAggregates: compoundEntity from: baseEntity attribute: attributeName
	"Purpose: Create n aggregates that will occupy the whole grid. Each aggregate is composed of cells that have the same value of anAttribute. This method resets all aggregates 'compoundEntity' and rebuilds them.
Attributes: baseEntity is a Class name inheriting from SpatialEntityElement. anAttribute is a symbol referring to a baseEntity's attribute name. compoundEntity is a Class name inheriting from SpatialEntitySet.
Example: self createAggregates: ZoneArea from: Cell attribute: #landCover"
	
	^self spaceModel setAggregates: compoundEntity from: baseEntity attribute:
			attributeName