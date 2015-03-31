accessing-Figures
entityFiguresAt: anImage put: aFigure
	"Store the figures (SpatialEntityCoordinates scaled to the window size) of anEntity into entityFigures (an identityDictionary ).
entityFigures = [ #class -> anIdentityDictionary (anImage -> aFigure anImage -> aFigure...)
				#class2 -> anIdentityDictionary (anImage -> aFigure anImage -> aFigure...)]"
	
	(self entityFigures
		at: anImage entityReference entityClass
		ifAbsentPut: [IdentityDictionary new]) at: anImage put: aFigure.
	Dev todo:
			'A Revoir
		entityFigures est uniquement utilis√©s pour le acc√©der aux figures des occupants pour un faire un track agents.
		Or actuellement les arcs utilisent enregistrent √©galement leur entityFigures
		Et par ailleurs les figures sont d√©j√† accessibles via les components du spaceView
		Il vaudrait donc mieux virer le entityFigures et passer par les components'