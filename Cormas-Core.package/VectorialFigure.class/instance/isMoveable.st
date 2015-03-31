testing
isMoveable
	
	(self entityType inheritsFrom: SpatialEntity) ifTrue: [^false].
	self container model siConfig
		ifNotNil: [:aConfig | ^aConfig canBeMovedFor: self model entity class].
	^true