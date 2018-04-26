model entities
getSortedListPotentialSpatialSuperclasses
	
	| aList highLevelClasses cellClassName |
	aList := OrderedCollection new.
	highLevelClasses := OrderedCollection new.
	self cormasModelClass cellClass isNil
		ifTrue:
			[highLevelClasses add: CMSpatialEntityElement.
			cellClassName := '']
		ifFalse:
			[cellClassName := self cormasModelClass cellClass name asString.
			highLevelClasses
				add: CMSpatialEntityAggregate;
				add: CMSpatialEntityNotConnex].
	(highLevelClasses asSortedCollection: [:i :j | i name < j name])
		do:
			[:anEntity | 
			(anEntity printHierarchy findTokens:Character cr)
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