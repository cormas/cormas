CSE (regular) - instance creation
setFragmentedEntities: compoundEntity from: baseEntity attribute: attributeName
	"baseEntity = a Class name inheriting from <SpatialEntity>	
		(can be <SpatialEntityCell> or <SpatialEntityAggregate> or <SpatialEntityNotConnex>) 
	compoundEntity = a Class name inheriting from <SpatialEntityNotConnex>"
	
	| fragmentedEntity beInstances collec |
	self boundaries = #closed ifFalse: [^self warningBoundaries].
	self resetCompoundSpatialEntity: compoundEntity andTheirComponents:
			baseEntity.
	beInstances := (self cormasModel
		perform: ('the' , baseEntity name asString , 's') asSymbol) copy
		asOrderedCollection.
	[beInstances isEmpty]
		whileFalse:
			[collec := beInstances
				select:
					[:c | (beInstances first perform: attributeName) = (c perform: attributeName)].
			beInstances removeAll: collec.
			fragmentedEntity := compoundEntity new: self.
			fragmentedEntity addSilentlyComponents: collec.
			fragmentedEntity type: (collec first perform: attributeName).
			(self spatialEntities at: compoundEntity name) add: fragmentedEntity].
	self dispatchCompoundSpatialEntity: compoundEntity.
	^self spatialEntities at: compoundEntity name