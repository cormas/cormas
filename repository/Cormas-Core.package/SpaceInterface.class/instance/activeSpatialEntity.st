accessing
activeSpatialEntity
	
	activeSpatialEntity isNil
		ifTrue: [activeSpatialEntity := self spaceModel cellClass].
	^activeSpatialEntity