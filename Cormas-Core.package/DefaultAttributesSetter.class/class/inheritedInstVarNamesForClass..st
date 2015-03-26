getParameters
inheritedInstVarNamesForClass: aClass
	"Return an array of the attributs of the superclass"
	
	| list entityClasses allEntityClasses aSuperclass |
	list := List new.
	entityClasses := Cormas allClassesInCategory: #'CormasKernel-Entities'
		fromNameSpace: Kernel.
	entityClasses
		addAll:
			(Cormas allClassesInCategory: #'CormasKernel-Interface' fromNameSpace:
					Kernel).
	entityClasses
		addAll:
			(Cormas allClassesInCategory: #'CormasKernel-Communication' fromNameSpace:
					Kernel).
	allEntityClasses := entityClasses copy.
	entityClasses do: [:c | allEntityClasses add: c class].
	aSuperclass := aClass superclass.	"I just want the attributs of the super class until the Entities class"
	[(allEntityClasses includes: aSuperclass)
		or: [aSuperclass = Object or: [aSuperclass = Object class]]]
		whileFalse:
			[list addAll: aSuperclass instVarNames.
			aSuperclass := aSuperclass superclass].
	^list