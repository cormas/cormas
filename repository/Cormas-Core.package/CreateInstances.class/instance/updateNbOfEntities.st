actions
updateNbOfEntities
	
	nbExistingEntities value: self entitiesCollection size.
	(self isSituatedEntity and: [nbExistingEntitiesSituated isNil not])
		ifTrue:
			[nbExistingEntitiesSituated
				value: (self entitiesCollection select: [:a | a isSituated]) size]