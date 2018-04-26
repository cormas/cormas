+ instance creation - spatial entities
createAggregates: compoundEntity fromSeeds: aCollecOfCells verifying: aBlock
	"Purpose: Create n aggregates made of an element of aCollecOfCells (a seed) and surrounding cells verifying a defined condition (aBlock). This method resets all aggregates 'compoundEntity' and rebuilds them.
Arguments: compoundEntity is a Class name inheriting from SpatialEntitySet.
aCollecOfCells is a collection of cells (SpatialEntityElement).
aBlock represnts the condition 
Example: self createAggregates: Forest fromSeeds: (self theCells select:[:c| c isForestSeed] verifying: [:c | c landCover ~= #water]"
	
	^self spaceModel setAggregates: compoundEntity fromSeeds: aCollecOfCells
		verifying: aBlock