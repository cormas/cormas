+ instance creation - spatial entities
createAggregates: compoundEntity fromSeeds: aCollecOfCells sizeDistribution: aDistribution
	"Purpose: Create aggregates from a collection of cells but the expansion of aggregates is constrained by a size distribution. This method requieres that the aggregate owns an attribute called givenSize. This method resets all aggregates 'compoundEntity' and rebuids them. 
Arguments:	aCollecOfCells = a collection of base entities (inheriting from <SpatialEntityElement>) 
compoundEntity = a subClass of  <SpatialEntitySet> 
aDistribution is a collection ( (n1,s1), (n2,s2)) , n being the number of aggregates of size s.
Example: self createAggregates: Forest fromSeeds: (self theCells select:[:c| c isForestSeed] sizeDistribution: (#(3 1) #(5 2) #(2 3)). --> create 3 aggregates of size 1, 5  aggregates of size 2, and 2 aggregates of size 3"
	
	^self spaceModel setAggregates: compoundEntity fromSeeds: aCollecOfCells
		sizeDistribution: aDistribution