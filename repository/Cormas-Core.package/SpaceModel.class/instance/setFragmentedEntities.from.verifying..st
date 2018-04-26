CSE (regular) - instance creation
setFragmentedEntities: compoundEntity from: baseEntity verifying: aBlock
	"baseEntity = a Class name inheriting from <SpatialEntity>
		(can be <SpatialEntityCell> or <SpatialEntityAggregate> or <SpatialEntityNotConnex>) 
	aBlock (example = [:cell | cell isTree] or [:aggregat | aggregat type = #forest] ) 
	compoundEntity = a Class name inheriting from <SpatialEntityNotConnex>"
	
	| fragmentedEntity beInstances |
	self boundaries = #closed ifFalse: [^self warningBoundaries].
	self resetCompoundSpatialEntity: compoundEntity andTheirComponents:
			baseEntity.
	beInstances := ((self cormasModel
		perform: ('the' , baseEntity name asString , 's') asSymbol)
		select: [:c | aBlock value: c]) copy asOrderedCollection.
	fragmentedEntity := compoundEntity new: self.
	fragmentedEntity addSilentlyComponents: beInstances.
	(self spatialEntities at: compoundEntity name) add: fragmentedEntity.
	self dispatchCompoundSpatialEntity: compoundEntity.
	^self spatialEntities at: compoundEntity name