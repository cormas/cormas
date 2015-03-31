private - irregular polygons creation
updateIncludedEntities: lesPolygones
	
	| polygonsWithIE newIncluded poly |
	polygonsWithIE := lesPolygones
		select: [:p | p includedEntities isEmpty not].
	polygonsWithIE
		do:
			[:b | 
			newIncluded := OrderedCollection new.
			b outline
				do:
					[:aPoint | 
					b bounds origin: (b bounds origin min: aPoint).
					b bounds corner: (b bounds corner max: aPoint)].
			b includedEntities
				do:
					[:c | 
					"A priori, s'il est inclus, le polygone c existe en tant que tel dans la liste globale des polygones"
					"Pas si simple !!! MapInfo agrege automatiquement les polygones inclus contigus !!!"
					"On teste sur  le premier point, theoriquement point de suture..."
					poly := lesPolygones select: [:cc | c includes: cc outline first].	"Sinon, c'est que le polygone b est non connexe, et c en est un composant !!!"
					poly isEmpty
						ifTrue: [self halt]
						ifFalse: [newIncluded addAll: poly]].
			b includedEntities: newIncluded.
			b neighbourhood isNil
				ifTrue: [b neighbourhood: b includedEntities copy]
				ifFalse: [b neighbourhood addAll: b includedEntities].	"on ajoute b comme voisin de chaque 'b includedEntities' . Ajout PB"
			newIncluded
				do:
					[:anEntity | 
					anEntity neighbourhood isNil
						ifTrue: [anEntity neighbourhood: (Set with: b)]
						ifFalse: [anEntity neighbourhood add: b]]]