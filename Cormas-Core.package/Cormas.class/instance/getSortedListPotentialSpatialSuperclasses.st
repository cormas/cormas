model entities
getSortedListPotentialSpatialSuperclasses
	
	| aList highLevelClasses cellClassName |
	aList := List new.
	highLevelClasses := IndexedSet new.
	self cormasModelClass cellClass isNil
		ifTrue:
			[highLevelClasses add: SpatialEntityElement.
			cellClassName := '']
		ifFalse:
			[cellClassName := self cormasModelClass cellClass name asString.
			highLevelClasses
				add: SpatialEntityAggregate;
				add: SpatialEntityNotConnex].
	(highLevelClasses asSortedCollection: [:i :j | i name < j name])
		do:
			[:anEntity | 
			(anEntity printHierarchy tokensBasedOn: Character cr)
				do: [:s | aList add: s]].
	aList
		removeAllSuchThat:
			[:s | 
			(Cormas dropBlanksFromString: s) = cellClassName
				or:
					[(Cormas spatialEntitiesClassNames
						includes: (Cormas dropBlanksFromString: s)) not
						and:
							[(self cormasModelClass allClassesNames
								includes: (Cormas dropBlanksFromString: s)) not]]].
	^aList	"perform: ((Cormas lowerCaseString: aType) , 'Classes') asSymbol)
		reject: [:anEntity | anEntity environment includes: anEntity superclass]."