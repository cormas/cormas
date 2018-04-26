action
entitiesAt: aClass
	
	^self entities
		at: aClass
		ifAbsentPut: [OrderedCollection new]