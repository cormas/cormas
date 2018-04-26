getAttributes
attributsWithAccessorsFromClass: aClass
	"returns a list of ClassAttributeValues of Entities that present the two accessors (setter & getter).
	!! All attributs without accessors are removed from the set "
	
	| set |
	set := OrderedCollection new.
	(self attributsFromClass: aClass)
		do:
			[:anAttribut | 
			((aClass compiledMethodAt: anAttribut asSymbol ifAbsent:[nil]) isNil
				or: [(aClass compiledMethodAt: (anAttribut , ':') asSymbol ifAbsent:[nil]) isNil])
				ifFalse: [set add: anAttribut asString]].
	^set