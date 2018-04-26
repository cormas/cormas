CSE (regular) - instance creation
setAggregates: compoundEntity fromSeeds: aCollec verifying: aBlock sizeDistribution: dis
	
	| haveSpread |
	self initAggregates: compoundEntity fromSeeds: aCollec sizeDistribution:
			dis.
	haveSpread := true.
	[haveSpread]
		whileTrue: [haveSpread := self swell: compoundEntity verifying: aBlock].
	^self spatialEntities at: compoundEntity name