deprecated
moveToRandomCell
	
	(self entityClass isNil not and: [self selectedEntities isEmpty not])
		ifTrue:
			[self selectedEntities
				do: [:e | e moveTo: cormas currentSimulation randomCell].
			nbExistingEntitiesSituated
				value: (self entitiesCollection select: [:a | a isSituated]) size]