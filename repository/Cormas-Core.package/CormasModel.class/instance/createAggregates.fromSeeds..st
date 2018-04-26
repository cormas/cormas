+ instance creation - spatial entities
createAggregates: compoundEntity fromSeeds: aCollecOfCells
	"Purpose: Create n aggregates that will occupy the whole grid. The number n of aggregates correspond to the size of aCollecOfCells. Each aggregate is made of an element of aCollecOfCells (a seed) and of its surrounding cells. This method resets all aggregates 'compoundEntity' and rebuilds them.
Arguments: aCollecOfCells is a collection of cells (SpatialEntityElement). compoundEntity is a Class name inheriting from SpatialEntitySet.
Example: self createAggregates: VitalArea fromSeeds: (self theDens collect:[:c | c patch])
Example: self createAggregates: Forest fromSeeds: (self theCells select:[:c| c isForestSeed]."
	
	^self spaceModel setAggregates: compoundEntity fromSeeds: aCollecOfCells