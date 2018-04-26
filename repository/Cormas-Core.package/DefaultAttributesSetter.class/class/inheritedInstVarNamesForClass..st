getParameters
inheritedInstVarNamesForClass: aClass
	"Return an array of the attributs of the superclass"
	
	| list entityClasses allEntityClasses aSuperclass |
	list := OrderedCollection new.
	entityClasses := ('Cormas-Core' asPackage classTagNamed: 'Entities') classes.
	entityClasses
		addAll:
			(('Cormas-Core' asPackage classTagNamed: 'Interface') classes).
	entityClasses
		addAll:
			(('Cormas-Core' asPackage classTagNamed: 'Communication') classes).
	allEntityClasses := entityClasses copy.
	entityClasses do: [:c | allEntityClasses add: c class].
	aSuperclass := aClass superclass.	"I just want the attributs of the super class until the Entities class"
	[(allEntityClasses includes: aSuperclass)
		or: [aSuperclass = Object or: [aSuperclass = Object class]]]
		whileFalse:
			[list addAll: aSuperclass instVarNames.
			aSuperclass := aSuperclass superclass].
	^list