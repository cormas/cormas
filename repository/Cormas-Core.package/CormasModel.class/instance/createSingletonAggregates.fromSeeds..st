+ instance creation - spatial entities
createSingletonAggregates: compoundEntity fromSeeds: aCollecOfCells
	"Purpose: Create n (n correspond to aCollecOfCells size) aggregates made of a single component which is an element of aCollecOfCells. This method resets all aggregates 'compoundEntity' and rebuilds them. Arguments: aCollecOfCells is a collection of cells (SpatialEntityElement). compoundEntity is a Class name inheriting from SpatialEntitySet.
Example: self createSingletonAggregates: Forest fromSeeds: (self theCells select:[:c| c isForestSeed]."
	
	^self spaceModel setSingletonAggregates: compoundEntity fromSeeds:
			aCollecOfCells