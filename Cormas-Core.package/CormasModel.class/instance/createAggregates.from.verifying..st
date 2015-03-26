+ instance creation - spatial entities
createAggregates: compoundEntity from: baseEntity verifying: aBlock
	"Purpose: Create n aggregates from cells that verify a condition. This method resets all aggregates 'compoundEntity' and rebuilds them. 
Arguments: compoundEntity is a Class name inheriting from SpatialEntitySet.
baseEntity is a Class name inheriting from SpatialEntityElement.
aBlock is the condition written as a block refering to a test on each of the base entity
Example: self createAggregates: Forest from: Cell verifying: [:aCell | aCell state = #tree]"
	
	^self spaceModel setAggregates: compoundEntity from: baseEntity verifying:
			aBlock