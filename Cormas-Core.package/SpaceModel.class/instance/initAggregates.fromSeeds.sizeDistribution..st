CSE (regular) - instance creation
initAggregates: compoundEntity fromSeeds: aCollecOfCells sizeDistribution: aDistribution
	"Create N spatial aggregates from a collection of N cells according to a size distribution. 
	The new aggregates are only composed of one cell (the seed); their 'givenSize' attribut value is determine by the distribution.
	This method resets all aggregates 'compoundEntity' and rebuids them. 
	aCollecOfCells = a collection of base entities (inheriting from <SpatialEntityElement>) 
	compoundEntity = a subClass of  <SpatialEntitySet> 
	this method is supposed to receive a size distribution 
	aDistribution = Collection ( (n1,s1), (n2,s2)) , n being the number of aggregates of size s. 

	Ex: to generate 3 aggregates size 1, 5 aggregates size 2, and 2 aggregates size 3, this has to be (#(3 1) #(5 2) #(2 3)). 
	This method uses the attribute called givenSize defined for SpatialEntityAggregate"
	
	| counter subsetIndice |
	self boundaries = #closed ifFalse: [^self warningBoundaries].
	self
		resetCompoundSpatialEntity: compoundEntity
		andTheirComponents: aCollecOfCells first class.
	((aDistribution collect: [:pair | pair first])
		inject: 0
		into: [:sum :i | sum + i]) ~= aCollecOfCells size
		ifTrue:
			[self error:
					'the number of seeds is different from the number of aggregates !!!'].
	counter := 0.
	subsetIndice := 1.
	aCollecOfCells
		do:
			[:cell | 
			(cell isComponentOf: compoundEntity)
				ifFalse:
					[(self
						createSilentlyAggregate: compoundEntity
						from: (OrderedCollection with: cell))
						givenSize: (aDistribution at: subsetIndice) last.
					counter := counter + 1.
					counter = (aDistribution at: subsetIndice) first
						ifTrue:
							[counter := 0.
							subsetIndice := subsetIndice + 1]]].
	self dispatchCompoundSpatialEntity: compoundEntity.
	^self spatialEntities at: compoundEntity name