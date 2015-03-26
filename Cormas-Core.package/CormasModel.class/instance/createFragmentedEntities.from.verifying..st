+ instance creation - spatial entities
createFragmentedEntities: compoundEntity from: baseEntity verifying: aBlock
	"Purpose: Create n fragmented spatial entities (SpatialEntityNotConnex) from baseEntities that verify a condition. This method resets all fragmented spatial entities 'compoundEntity' and rebuilds them.
Arguments: baseEntity is a Class name inheriting from <SpatialEntity> (can be <SpatialEntityElement>, <SpatialEntityCell>, <SpatialEntityAggregate> or <SpatialEntityNotConnex>).
Example: 	self createFragmentedEntities: Forest from: Cell verifying: [:aCell | aCell state = #tree].
self createFragmentedEntities: Forest from: Cell verifying: [:aggregat | aggregat type = #forest] "
	
	^self spaceModel setFragmentedEntities: compoundEntity from: baseEntity
		verifying: aBlock