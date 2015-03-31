private - accessing
getInstanceOfClass: aClass fromId: anId
	
	(self spatialEntities isNil
		or:
			[self spatialEntities isEmpty
				or:
					[(self spatialEntities includesKey: aClass name) not
						or: [(self spatialEntities at: aClass name) isEmpty]]])
		ifTrue: [^nil]
		ifFalse:
			[^(self spatialEntities at: aClass name)
				detect: [:i | i id = anId]
				ifNone: [nil]]