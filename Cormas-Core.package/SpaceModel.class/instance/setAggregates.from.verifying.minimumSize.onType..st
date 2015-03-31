deprecated
setAggregates: compoundEntity from: baseEntity verifying: aBlock minimumSize: ms onType: aType
	"baseEntity = a subClass of  <SpatialEntity> 
aBlock example = [:cell | cell state = #tree] 
compoundEntity = a subClass of  <SpatialEntitySet> 
ms= <integer> must be >= 1"
	
	(self setAggregates: compoundEntity from: baseEntity verifying: aBlock
		minimumSize: ms) do: [:ag | ag type: aType]