actions
addToEntitiesSelection
	
	| collec |
	(((self entityClass isNil not and: [testValue value isNil not])
		and: [testElement value ~= '']) and: [operator value ~= ''])
		ifTrue:
			[collec := self getSelectedEntities.
			collec
				ifNil: [^nil]
				ifNotNil: [self selectedEntities addAll: collec].
			self nbEntitiesSelected value: self selectedEntities size.
			self isSituatedEntity
				ifTrue:
					[self nbEntitiesSelectedSituated
						value: (self selectedEntities select: [:a | a isSituated]) size].
			self linkedSpaceInterface
				ifNotNil: [self updateFiguresSelectedOnSpaceInterface]]