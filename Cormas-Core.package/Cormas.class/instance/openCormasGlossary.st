main menu
openCormasGlossary
	
	| allClasses |
	allClasses := OrderedCollection new.
	allClasses add: Cormas.
	allClasses add: CormasModel.
	allClasses
		addAll:
			(Cormas allClassesInCategory: #'CormasKernel-Entities' fromNameSpace:
					Kernel).
	^self openCormasGlossaryClasses: allClasses