CSE (regular) - instance creation
setAggregates: compoundEntity from: baseEntity attribute: attributeName
	"The aggregates occupy the whole grid. 
	This method resets all aggregates 'compoundEntity' and rebuids them. 
	baseEntity = a subClass of  <SpatialEntity> 
	attributeName = #context for example 
	compoundEntity = a subClass of  <SpatialEntitySet>"
	
	self boundaries = #closed ifFalse: [^self warningBoundaries].
	self resetCompoundSpatialEntity: compoundEntity andTheirComponents:
			baseEntity.
	(self getAggregatesFrom: baseEntity attribute: attributeName)
		do: [:set | self createSilentlyAggregate: compoundEntity from: set].
	self dispatchCompoundSpatialEntity: compoundEntity.
	^self spatialEntities at: compoundEntity name