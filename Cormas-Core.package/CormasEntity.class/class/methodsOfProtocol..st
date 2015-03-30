- accessing - methods & classes
methodsOfProtocol: protocolName
	"Return a set of all the methods of model classes which are in the given protocol and of all the methods of cormas entity classes which are in the protocol '* protocolName'"
	
	| protocolNameForCormasClasses collModel collCormas |
	protocolNameForCormasClasses := '* ' , protocolName.
	collModel := IndexedSet new.
	collCormas := IndexedSet new.
	(self superClassesUntil: CormasEntity)
		do:
			[:aClass | 
			(self environment includes: aClass)
				ifTrue:
					[collModel
						addAll:
							(aClass organization listAtCategoryNamed: protocolName) sorted]
				ifFalse:
					[(aClass organization categories
						select:
							[:aSymbol | 
							(aSymbol asString findString: protocolNameForCormasClasses startingAt: 1) =
									1])
						do:
							[:aP | collCormas addAll: (aClass organization listAtCategoryNamed: aP)]]	"methods of model classes"	"methods of cormas entity classes"].
	collModel addAll: collCormas sorted.
	^collModel