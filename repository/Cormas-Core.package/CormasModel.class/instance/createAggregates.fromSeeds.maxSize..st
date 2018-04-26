+ instance creation - spatial entities
createAggregates: compoundEntity fromSeeds: aCollecOfCells maxSize: anInteger
	"Purpose: Create aggregates from a collection of cells but the expansion of aggregates is constrained by a maximum size This method resets all aggregates 'compoundEntity' and rebuids them. 
Arguments:	aCollecOfCells = a collection of base entities (inheriting from <SpatialEntityElement>) 
compoundEntity = a subClass of  <SpatialEntitySet> 
anInteger is the maximum size an aggregate may have .
Example: self createAggregates: Forest fromSeeds: (self pickN: 5 entities: Cell) maxSize: 12   -> Will create 5 forests of a maximum size of 12"
	
	^self
		createAggregates: compoundEntity
		fromSeeds: aCollecOfCells
		sizeDistribution:
			(Array
				with:
					(Array
						with: aCollecOfCells size
						with: anInteger))