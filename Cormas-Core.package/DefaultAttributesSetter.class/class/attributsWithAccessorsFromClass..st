getAttributes
attributsWithAccessorsFromClass: aClass
	"returns a list of ClassAttributeValues of Entities that present the two accessors (setter & getter).
	!! All attributs without accessors are removed from the set "
	
	| set |
	set := IndexedSet new.
	(self attributsFromClass: aClass)
		do:
			[:anAttribut | 
			((aClass findSelector: anAttribut asSymbol) isNil
				or: [(aClass findSelector: (anAttribut , ':') asSymbol) isNil])
				ifFalse: [set add: anAttribut asString]].
	^set