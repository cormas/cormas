getParameters
getDefaultParametersValues
	"get the defaultParameters.
	defaultParameters is an OrderedCollection containing OrderedCollections as following : 
	( index-i : Class ; attributName asSymbol ; defaultValue ) 
	( index-i : Class ; attributName asSymbol ; defaultValue ) ..."
	
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
						getDefaultValuesForClass: aKlass class
						attributs: attributs).
			attributs := self class attributsWithAccessorsFromClass: aKlass.
			defaultParameters
				addAll:
					(self class getDefaultValuesForClass: aKlass attributs: attributs)].
	^defaultParameters