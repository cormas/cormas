initialization
initializeListsContents: entityTypeString
	" Private - Populate the receiver's lists using the current loaded model "

	| aList highLevelClasses |
	aList := OrderedCollection new.
	highLevelClasses := (self cormasModelClass
		perform: (entityTypeString asLowercase , 'Classes') asSymbol)
			reject: [ : anEntity | anEntity cmEnvironment includes: anEntity superclass].
	(highLevelClasses asSortedCollection: [ : i : j | i name < j name]) 
		do: [ : anEntity | 
			(anEntity cmPrintHierarchy findTokens: Character cr)
				do: [ : s | aList add: s ] ].
	^ aList	