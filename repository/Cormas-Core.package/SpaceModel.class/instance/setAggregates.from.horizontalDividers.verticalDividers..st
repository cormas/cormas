CSE (regular) - instance creation
setAggregates: compoundEntity from: baseEntity horizontalDividers: xRatio verticalDividers: yRatio
	"Creates (xRatio x yRatio) aggregates by dividing the grid by yRatio columns and xRatio lines.
The aggregates will  occupy the whole grid. 
	This method resets all aggregates 'compoundEntity' and rebuids them. 
	baseEntity = a subClass of  <SpatialEntity> 
	compoundEntity = a subClass of  <SpatialEntitySet>"
	
	self boundaries = #closed ifFalse: [^self warningBoundaries].
	self resetCompoundSpatialEntity: compoundEntity andTheirComponents:
			baseEntity.
	(self getSetsOfContiguous: baseEntity horizontalDividers: xRatio
		verticalDividers: yRatio)
		do: [:set | self createSilentlyAggregate: compoundEntity from: set].
	self dispatchCompoundSpatialEntity: compoundEntity.
	^self spatialEntities at: compoundEntity name