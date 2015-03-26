action
entitiesAt: aClass
	
	^self entities
		at: aClass
		ifAbsentPut: [IndexedSet new]