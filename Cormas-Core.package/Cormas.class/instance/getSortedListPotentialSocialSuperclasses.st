model entities
getSortedListPotentialSocialSuperclasses
	
	| aList highLevelClasses |
	aList := List new.
	highLevelClasses := IndexedSet new.
	highLevelClasses add: Agent.
	(highLevelClasses asSortedCollection: [:i :j | i name < j name])
		do:
			[:anEntity | 
			(anEntity printHierarchy tokensBasedOn: Character cr)
				do: [:s | aList add: s]].
	aList
		removeAllSuchThat:
			[:s | 
			(Cormas socialEntitiesClassNames includes: (Cormas dropBlanksFromString: s))
				not
				and:
					[(self cormasModelClass allClassesNames
						includes: (Cormas dropBlanksFromString: s)) not]].
	^aList	"perform: ((Cormas lowerCaseString: aType) , 'Classes') asSymbol)
		reject: [:anEntity | anEntity environment includes: anEntity superclass]."