CSE (regular) - instance creation
setAggregates: compoundEntity from: baseEntity attribute: attributeName excludingValue: aValue
	"The aggregates do not occupy the whole grid. 
	This method resets all aggregates 'compoundEntity' and rebuids them. 
	baseEntity = a subClass of  <SpatialEntity> 
	attributeName = #context for example 
	aValue is a specific value of the attribute, for instance #notDefined, or 0
	compoundEntity = a subClass of  <SpatialEntitySet>"
	
	self boundaries = #closed ifFalse: [^self warningBoundaries].
	self resetCompoundSpatialEntity: compoundEntity andTheirComponents:
			baseEntity.
	(self getSetsOfContiguous: baseEntity attribute: attributeName
		excludingValue: aValue)
		do: [:set | self createSilentlyAggregate: compoundEntity from: set].
	self dispatchCompoundSpatialEntity: compoundEntity.
	^self spatialEntities at: compoundEntity name