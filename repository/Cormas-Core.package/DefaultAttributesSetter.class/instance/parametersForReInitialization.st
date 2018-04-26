getParameters
parametersForReInitialization
	"return a list of ClassAttributeValues containg all the parameters, without the Entity instances' attributs"
	
	| allClasses parameters attributs |
	allClasses := self cormasModel class allTerminalClasses.
	allClasses addFirst: self cormasModel class.
	parameters := OrderedCollection new.
	allClasses
		do:
			[:aKlass | 
			(aKlass = self cormasModel class
				or: [aKlass = self cormasModel class cellClass])
				ifTrue:
					[attributs := self class attributsWithAccessorsFromClass: aKlass.
					attributs
						do:
							[:attrib | 
							parameters
								add:
									(ClassAttributeValue
										newClass: aKlass
										attribute: attrib asSymbol
										value: nil)]].
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