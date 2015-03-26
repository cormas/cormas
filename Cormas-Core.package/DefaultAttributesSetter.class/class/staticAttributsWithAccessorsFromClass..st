getAttributes
staticAttributsWithAccessorsFromClass: aClass
	"Return a set containing the static variable names (as string) of aClass and all its super classes until the Cormas entity classes.
!! All attributs without accessors are removed from the set "
	
	| set |
	set := Set new.
	(self staticAttributsFromClass: aClass)
		do:
			[:anAttribut | 
			((aClass class findSelector: anAttribut asSymbol) isNil
				or: [(aClass class findSelector: (anAttribut , ':') asSymbol) isNil])
				ifFalse: [set add: anAttribut asString]].
	^set