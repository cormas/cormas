accessing from entity references
findFigureFor: anEntityReference
	
	^(self entityFiguresAt: anEntityReference entityClass)
		detect:
			[:fig | fig model entityReference entityId = anEntityReference entityId]
		ifNone: [nil]