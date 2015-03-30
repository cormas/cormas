deprecated
selectAllEntities
	
	self entityClass
		ifNotNil:
			[self selectedEntities: self entitiesCollection.
			self nbEntitiesSelected value: self selectedEntities size.
			self isSituatedEntity
				ifTrue:
					[self nbEntitiesSelectedSituated
						value: (self selectedEntities select: [:a | a isSituated]) size]]