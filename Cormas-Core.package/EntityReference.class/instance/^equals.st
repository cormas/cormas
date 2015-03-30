comparing
= anObject
	
	^anObject class == EntityReference
		and:
			[anObject entityId == self entityId
				and: [anObject entityClass == self entityClass]]