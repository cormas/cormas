testing
isMoveable
	
	self container model siConfig
		ifNil: [^self entityType isSpatialClass not]
		ifNotNil:
			[^self container model siConfig canBeMovedFor: self model entity class]