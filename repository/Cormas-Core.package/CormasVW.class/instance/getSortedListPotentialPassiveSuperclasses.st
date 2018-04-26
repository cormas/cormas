model entities
getSortedListPotentialPassiveSuperclasses
	
	| aList highLevelClasses |
	aList := OrderedCollection new.
	highLevelClasses := OrderedCollection new.
	highLevelClasses
		add: CMPassiveObject;
		add: CMMsg.
	(highLevelClasses asSortedCollection: [ :i :j | i name < j name])
		do: [ : anEntity | 
			(anEntity printHierarchy findTokens: Character cr)
				do: [ : s | aList add: s ] ].
	aList
		removeAllSuchThat: [ : s | 
			(Cormas passiveEntitiesClassNames
				includes: (Cormas dropBlanksFromString: s)) not
				and: [ (self cormasModelClass allClassesNames includes: (Cormas dropBlanksFromString: s)) not ] ].
	^aList 	"perform: ((Cormas lowerCaseString: aType) , 'Classes') asSymbol)
		reject: [:anEntity | anEntity environment includes: anEntity superclass]."