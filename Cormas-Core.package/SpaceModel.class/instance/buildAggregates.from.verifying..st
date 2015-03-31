CSE (regular) - instance creation
buildAggregates: compoundEntity from: baseEntity verifying: aBlock
	"This method is equivalent to setAggregates: compoundEntity from: baseEntity verifying: aBlock, except that the aggregats are not reset.
baseEntity = a subClass of <SpatialEntityElement>
aBlock example = [:cell | cell state = #tree]
compoundEntity = a subClass of  <SpatialEntitySet>"
	
	^self buildAggregates: compoundEntity from: baseEntity verifying: aBlock
		minimumSize: 1