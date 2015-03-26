+ instance creation - spatial entities
createAggregates: compoundEntity fromSeeds: aCollecOfCells verifying: aBlock sizeDistribution: dis
	"Purpose: Create n aggregates made of an element of aCollecOfCells (a seed) and surrounding cells verifying a defined condition (aBlock). The expansion of aggregates is constrained by a size distribution. This method resets all aggregates 'compoundEntity' and rebuilds them.
Arguments: compoundEntity is a Class name inheriting from SpatialEntitySet.
aCollecOfCells is a collection of cells (SpatialEntityElement).
aBlock represnts the condition 
aDistribution is a collection ( (n1,s1), (n2,s2)) , n being the number of aggregates of size s.
Example: self createAggregates: Forest fromSeeds: (self theCells select:[:c| c isForestSeed] verifying: [:c | c state isNil not] sizeDistribution: (#(3 1) #(5 2) #(2 3))"
	
	^self spaceModel setAggregates: compoundEntity fromSeeds: aCollecOfCells
		verifying: aBlock sizeDistribution: dis