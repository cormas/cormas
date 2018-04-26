private - regular polygons
isPartitionComplete: compoundEntity
	
	^(self elementaryEntities
		contains: [:c | (c isComponentOf: compoundEntity) not]) not