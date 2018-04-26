CSE (regular) - instance creation
setAggregates: compoundEntity from: baseEntity verifying: aBlock minimumSize: ms
	"baseEntity = a subClass of  <SpatialEntityElement>
aBlock example = [:cell | cell state = #tree]
compoundEntity = a subClass of  <SpatialEntitySet>
ms= <integer> must be >= 1
This method resets all aggregats 'compoundEntity' and rebuids them"
	
	self resetCompoundSpatialEntity: compoundEntity andTheirComponents:
			baseEntity.
	^self buildAggregates: compoundEntity from: baseEntity verifying: aBlock
		minimumSize: ms