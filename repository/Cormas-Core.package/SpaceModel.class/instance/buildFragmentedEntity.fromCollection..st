CSE (regular) - instance creation
buildFragmentedEntity: compoundEntity fromCollection: aCollecOfSpatialEntityElement
	"create one aggregate <SpatialEntityNotConnex> made of a collection of spatialEntityElements.
	This method do not resets all aggregates 'compoundEntity' . 
	aCollecOfSpatialEntityElement = a collection of base entities (inheriting from <SpatialEntity>) 
	compoundEntity = a subClass of  <SpatialEntityNotConnex>"
	
	| aSet agg |
	self boundaries = #closed ifFalse: [^self warningBoundaries].
	aSet := Set new.
	aCollecOfSpatialEntityElement
		do: [:s | (s isComponentOf: compoundEntity) ifTrue: [aSet add: s]].
	agg := self createSilentlyAggregate: compoundEntity from: aSet.
	self dispatchCompoundSpatialEntity: compoundEntity.
	^agg