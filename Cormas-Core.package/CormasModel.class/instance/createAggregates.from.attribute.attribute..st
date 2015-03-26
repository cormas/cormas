+ instance creation - spatial entities
createAggregates: compoundEntity from: baseEntity attribute: attributeName1 attribute: attributeName2
	"Purpose: Create n aggregates that will occupy the whole grid. Each aggregate is composed of cells that have the same value for anAttributeName1 and anAttributeName2. This method resets all aggregates 'compoundEntity' and rebuilds them.
Attributes: baseEntity is a Class name inheriting from SpatialEntityElement. attributeName1 and attributeName2 are symbols referring to a baseEntity's attribute name. compoundEntity is a Class name inheriting from SpatialEntitySet.
Example: self createAggregates: DistrictZoneArea from: Cell attribute: #landCover attribute: #district"
	
	^self spaceModel setAggregates: compoundEntity from: baseEntity attribute:
			attributeName1 attribute: attributeName2