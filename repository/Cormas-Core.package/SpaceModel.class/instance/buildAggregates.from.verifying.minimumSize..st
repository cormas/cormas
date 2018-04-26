CSE (regular) - instance creation
buildAggregates: compoundEntity from: baseEntity verifying: aBlock minimumSize: ms
	"This method is equivalent to setAggregates: compoundEntity from: baseEntity verifying: aBlock minimumSize: ms, except that the previous aggregats are not reset.
baseEntity = a subClass of  <SpatialEntity>
aBlock example = [:cell | cell state = #tree]
compoundEntity =a subClass of  <SpatialEntitySet>
ms= <integer> must be >= 1"
	
	| coll |
	self boundaries = #closed ifFalse: [^self warningBoundaries].
	coll := OrderedCollection new.
	(self getAggregatesFrom: baseEntity verifying: aBlock)
		do:
			[:set | 
			set size < ms
				ifFalse:
					[coll add: (self createSilentlyAggregate: compoundEntity from: set)]].
	self dispatchCompoundSpatialEntity: compoundEntity.
	^coll