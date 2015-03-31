CSE (regular) - instance creation
initAggregates: compoundEntity fromSeeds: aCollec
	"Create N aggregates from a collection of N cells. 
	The new aggregates are only composed of one cell (the seed); their 'givenSize' attribut value is determine by the distribution.
	This method resets all aggregates 'compoundEntity' and rebuids them. 
	aCollec = a collection of base entities (inheriting from <SpatialEntityElement>) 
	compoundEntity = a subClass of  <SpatialEntitySet> "
	
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