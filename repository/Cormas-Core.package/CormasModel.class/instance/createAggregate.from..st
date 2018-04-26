+ instance creation - spatial entities
createAggregate: compoundEntity from: aSet
	"Purpose: Creates and returns an instance of compoundEntity composed with a set of cells.
Arguments: 	aSet = a set of base entities (inheriting from <SpatialEntity>) 
	compoundEntity = a Class name inheriting from <SpatialEntitySet>
Example: self createAggregate: Plot from: (self centalCell recursiveNeighbourhood: 5)"
	
	^self spaceModel createOneAggregate: compoundEntity from: aSet