CSE (regular) - instance creation
setAggregates: compoundEntity fromSeeds: aCollec verifying: aBlock
	
	| haveSpread |
	self initAggregates: compoundEntity fromSeeds: aCollec.
	haveSpread := true.
	[haveSpread]
		whileTrue: [haveSpread := self swell: compoundEntity verifying: aBlock].
	^self spatialEntities at: compoundEntity name