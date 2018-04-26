+ instance creation - spatial entities
createAggregates: compoundEntity from: baseEntity verifying: aBlock minimumSize: ms
	"Purpose: Create n aggregates from cells that verify a condition. Aggregates are built only if they can contain a minimum number of cells specified by ms (ms must be >= 1). This method resets all aggregates 'compoundEntity' and rebuilds them. 
Attributes: baseEntity is a Class name inheriting from SpatialEntityElement. attributeName1 and attributeName2 are symbols referring to a baseEntity's attribute name.
compoundEntity is a Class name inheriting from SpatialEntitySet.
ms is an integer
Example: self createAggregates: Forest from: Cell verifying: [:aCell | aCell state = #tree] minimumSize: 5"
	
	^self spaceModel setAggregates: compoundEntity from: baseEntity verifying:
			aBlock minimumSize: ms