CSE (regular) - instance creation
setFragmentedEntity: compoundEntity fromCollection: aCollecOfSpatialEntityElement
	"create one aggregate <SpatialEntityNotConnex> made of a collection of spatialEntityElements.
	This method resets all aggregates 'compoundEntity' and rebuids them. 
	aCollecOfSpatialEntityElement = a collection of base entities (inheriting from <SpatialEntityElement>) 
	compoundEntity = a Class name inheriting from <SpatialEntityNotConnex>"
	
	| aSet |
	self boundaries = #closed ifFalse: [^self warningBoundaries].
	self
		resetCompoundSpatialEntity: compoundEntity
		andTheirComponents: aCollecOfSpatialEntityElement first class.
	aSet := Set new.
	aCollecOfSpatialEntityElement
		do: [:s | (s isComponentOf: compoundEntity) ifTrue: [aSet add: s]].
	self createSilentlyAggregate: compoundEntity from: aSet.
	self dispatchCompoundSpatialEntity: compoundEntity.
	^self spatialEntities at: compoundEntity name