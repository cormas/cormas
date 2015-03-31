CSE (regular) - instance creation
setAggregates: compoundEntity fromSeeds: aCollecOfCells sizeDistribution: aDistribution
	"Create aggregates from a collection of cells according to a size distribution. 
	This method resets all aggregates 'compoundEntity' and rebuids them. 
	aCollecOfCells = a collection of base entities (inheriting from <SpatialEntityElement>) 
	compoundEntity = a subClass of  <SpatialEntitySet> 
	this method is supposed to receive a size distribution 
	aDistribution = Collection ( (n1,s1), (n2,s2)) , n being the number of aggregates of size s. 
	Example: to generate 3 aggregates size 1, 5 aggregates size 2, and 2 aggregates size 3, this has to be (#(3 1) #(5 2) #(2 3)). 
		self spaceModel setAggregates: Forest fromSeeds: self theCells sizeDistribution: #(#(3 1) #(5 2) #(2 3)) 
	This method uses the attribute called givenSize defined for SpatialEntityAggregate"
	
	| haveSpread coll |
	coll := self initAggregates: compoundEntity fromSeeds: aCollecOfCells
		sizeDistribution: aDistribution.
	haveSpread := true.
	[haveSpread] whileTrue: [haveSpread := self swell: compoundEntity].
	^coll