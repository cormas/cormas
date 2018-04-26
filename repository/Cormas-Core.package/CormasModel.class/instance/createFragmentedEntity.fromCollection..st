+ instance creation - spatial entities
createFragmentedEntity: compoundEntity fromCollection: aCollecOfSpatialEntityElement
	"Purpose: Create one fragmented spatial entity <SpatialEntityNotConnex> made of a collection of spatialEntityElements. This method resets all fragmented spatial entities 'compoundEntity' and rebuilds them. 
Arguments: aCollecOfSpatialEntityElement is a collection of base entities (inheriting from <SpatialEntityElement>).
compoundEntity = a Class name inheriting from <SpatialEntityNotConnex>
Example: self createFragmentedEntity: UrbanArea fromCollection: (self theCells select:[:c | c landUse = #building])"
	
	^self spaceModel setFragmentedEntity: compoundEntity fromCollection:
			aCollecOfSpatialEntityElement