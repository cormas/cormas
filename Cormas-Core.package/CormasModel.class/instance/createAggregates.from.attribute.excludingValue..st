+ instance creation - spatial entities
createAggregates: compoundEntity from: baseEntity attribute: attributeName excludingValue: aValue
	"Purpose: Create n aggregates that will not necessarily occupy the whole grid. Cells which have aValue for anAttribute are excluded from the process. Each aggregate is composed of cells that have the same value of anAttribute (except the excluded one). This method resets all aggregates 'compoundEntity' and rebuilds them.
Attributes: compoundEntity is a Class name inheriting from SpatialEntitySet. baseEntity is a Class name inheriting from SpatialEntityElement. anAttributeName is a symbol referring to a baseEntity's attribute name. aValue is a specific value of the attribute, for instance #notDefined, or 0. 
Example: self createAggregates: ZoneArea from: Cell attribute: #landCover excludingValue: #water"
	
	^self spaceModel setAggregates: compoundEntity from: baseEntity attribute:
			attributeName excludingValue: aValue