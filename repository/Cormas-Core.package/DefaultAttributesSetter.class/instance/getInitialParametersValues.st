getParameters
getInitialParametersValues
	"get the Initial Parameters.
	initialParameters is an OrderedCollection containing OrderedCollections as following : 
	( index-i : Class ; attributName asSymbol ; initValue ) 
	( index-i : Class ; attributName asSymbol ; initValue ) ..."
	
	| allClasses attributs defaultParameters |
	allClasses := self cormasModel class allTerminalClasses.
	allClasses addFirst: self cormasModel class.
	defaultParameters := OrderedCollection new.
	allClasses
		do:
			[:aKlass | 
			attributs := self class staticAttributsWithAccessorsFromClass: aKlass.
			defaultParameters
				addAll:
					(self class
						getInitialValuesForClass: aKlass class
						attributs: attributs).
			attributs := self class attributsWithAccessorsFromClass: aKlass.
			defaultParameters
				addAll:
					(self class getInitialValuesForClass: aKlass attributs: attributs)].
	^defaultParameters