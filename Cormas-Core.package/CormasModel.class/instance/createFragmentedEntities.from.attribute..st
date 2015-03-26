+ instance creation - spatial entities
createFragmentedEntities: compoundEntity from: baseEntity attribute: attributeName
	"Purpose: Create n fragmented spatial entities <SpatialEntityNotConnex>. Each fragmented spatial entity is composed of spatial elements that have the same value of anAttribute. This method resets all fragmented spatial entities 'compoundEntity' and rebuilds them.
Arguments: baseEntity is a Class name inheriting from <SpatialEntity> (can be <SpatialEntityElement>, <SpatialEntityCell>, <SpatialEntityAggregate> or <SpatialEntityNotConnex>).
Example: self createFragmentedEntities: ForestGroup from: Forest attribute: #forestType"
	
	^self spaceModel setFragmentedEntities: compoundEntity from: baseEntity
		attribute: attributeName