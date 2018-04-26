getParameters
parametersWithAccessors
	"return a list of ClassAttributeValues containg all the parameters."
	
	| allClasses parameters attributs |
	allClasses := self cormasModel class allTerminalClasses.
	allClasses addFirst: self cormasModel class.
	parameters := OrderedCollection new.
	allClasses
		do:
			[:aKlass | 
			attributs := self class attributsWithAccessorsFromClass: aKlass.
			attributs
				do:
					[:attrib | 
					parameters
						add:
							(ClassAttributeValue
								newClass: aKlass
								attribute: attrib asSymbol
								value: nil)].
			attributs := self class staticAttributsWithAccessorsFromClass: aKlass.
			attributs
				do:
					[:attrib | 
					parameters
						add:
							(ClassAttributeValue
								newClass: aKlass class
								attribute: attrib asSymbol
								value: nil)]].
	^parameters