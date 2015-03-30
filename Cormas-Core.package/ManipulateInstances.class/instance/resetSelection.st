actions
resetSelection
	
	self entityClass
		ifNotNil:
			[self selectedEntities: nil.
			self nbEntitiesSelected value: nil.
			self isSituatedEntity
				ifTrue: [self nbEntitiesSelectedSituated value: nil].
			self linkedSpaceInterface
				ifNotNil: [self updateFiguresSelectedOnSpaceInterface]]