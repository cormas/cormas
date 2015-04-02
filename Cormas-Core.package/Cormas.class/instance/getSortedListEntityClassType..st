model entities
getSortedListEntityClassType: aType
	"aType is either 'Spatial', 'Social' or 'Passive'"
	
	| aList highLevelClasses |
	aList := List new.
	highLevelClasses := (self cormasModelClass
		perform: ((Cormas lowerCaseString: aType) , 'Classes') asSymbol)
		reject: [:anEntity | anEntity environment includes: anEntity superclass].
	(highLevelClasses asSortedCollection: [:i :j | i name < j name])
		do:
			[:anEntity | 
			(anEntity printHierarchy tokensBasedOn: Character cr)
				do: [:s | aList add: s]].
	^aList