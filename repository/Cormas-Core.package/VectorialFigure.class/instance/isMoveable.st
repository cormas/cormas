testing
isMoveable
	
	(self entityType inheritsFrom: CMSpatialEntity) ifTrue: [^false].
	self container model siConfig
		ifNotNil: [:aConfig | ^aConfig canBeMovedFor: self model entity class].
	^true