+ instance creation - spatial entities
createSingleAggregateFromGrid: compoundEntity
	"Purpose: Create one instance of compoundEntity from all the cells <SpatialEntityElement> of the grid. This method resets all aggregates 'compoundEntity' and rebuilds them.
Arguments: compoundEntity is a Class name inheriting from <SpatialEntitySet>
Example: self createSingleAggregateFromGrid: Territory"
	
	^self spaceModel setGridAsAggregat: compoundEntity