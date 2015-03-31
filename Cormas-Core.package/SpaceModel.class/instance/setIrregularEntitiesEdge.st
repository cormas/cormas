private - irregular polygons creation
setIrregularEntitiesEdge
	
	| outlineTempo |
	self elementaryEntities isEmpty ifTrue: [^self halt].
	self elementaryEntities
		do:
			[:aCell | 
			aCell neighbourhood isNil ifTrue: [^self halt].	"on test d'abord si il y a des voisins en bordure: si yenapas ben b n'est pas en bordure"
			(aCell neighbourhood contains: [:neigh | neigh edge ~= false])
				ifFalse: [aCell edge: false]
				ifTrue:
					[outlineTempo := aCell outline copy.
					aCell neighbourhood
						do:
							[:c | outlineTempo removeAllSuchThat: [:point | c outline includes: point]].
					aCell edge: outlineTempo isEmpty not]]