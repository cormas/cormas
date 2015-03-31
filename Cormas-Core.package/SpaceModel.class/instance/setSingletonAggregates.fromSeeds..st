CSE (regular) - instance creation
setSingletonAggregates: compoundEntity fromSeeds: aCollec
	"create n (aCollec size) aggregates made of a single component which is an element of aCollec.
	This method resets all aggregates 'compoundEntity' and rebuids them. 
	aCollec = a collection of base entities (inheriting from <SpatialEntity>) 
	compoundEntity = a Class name inheriting from <SpatialEntitySet>"
	
	self boundaries = #closed ifFalse: [^self warningBoundaries].
	self
		resetCompoundSpatialEntity: compoundEntity
		andTheirComponents: aCollec first class.
	aCollec
		do:
			[:s | 
			(s isComponentOf: compoundEntity)
				ifFalse:
					[self
						createSilentlyAggregate: compoundEntity
						from: (Set with: s)]].
	self dispatchCompoundSpatialEntity: compoundEntity.
	^self spatialEntities at: compoundEntity name