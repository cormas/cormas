initialize-release
getAllAttributesList
	
	| aList defaultParameters cav |
	aList := Array new. "List from VW are changed to Array"
	defaultParameters := self getInitialParametersValues.
	defaultParameters := defaultParameters
		select: [:coll | coll first subclasses isEmpty].
	defaultParameters
		do:
			[:coll | 
			"(coll at: 3) isSymbol ifTrue:[coll at: 3 put: (coll at: 3) printString]."
			cav := ClassAttributeValue
				newClass: coll first
				attribute: (coll at: 2)
				value: (coll at: 3).
			cav testIfModified.
			aList add: cav].
	self purgeClassAttribValue: aList.
	^aList