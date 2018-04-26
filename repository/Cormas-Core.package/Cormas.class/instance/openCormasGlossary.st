main menu
openCormasGlossary
	
	| allClasses |
	allClasses := OrderedCollection new.
	allClasses add: Cormas.
	allClasses add: CormasModel.
	allClasses
		addAll:
			('Cormas-Core' asPackage classTagNamed: 'Entities') classes.
	^self openCormasGlossaryClasses: allClasses