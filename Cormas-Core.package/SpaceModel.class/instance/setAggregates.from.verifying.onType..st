deprecated
setAggregates: compoundEntity from: baseEntity verifying: aBlock onType: aType
	"baseEntity = a subClass of  <SpatialEntity> 
aBlock example = [:cell | cell state = #tree] 
compoundEntity = a subClass of  <SpatialEntitySet>"
	
	(self setAggregates: compoundEntity from: baseEntity verifying: aBlock)
		do: [:ag | ag type: aType]