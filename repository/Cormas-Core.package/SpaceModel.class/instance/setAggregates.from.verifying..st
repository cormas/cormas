CSE (regular) - instance creation
setAggregates: compoundEntity from: baseEntity verifying: aBlock
	"baseEntity = a subClass of  <SpatialEntityElement>
aBlock example = [:cell | cell state = #tree]
compoundEntity = a subClass of  <SpatialEntitySet>
This method resets all aggregats 'compoundEntity' and rebuids them"
	
	^self setAggregates: compoundEntity from: baseEntity verifying: aBlock
		minimumSize: 1