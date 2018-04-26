getAttributes
staticAttributsFromClass: aClass
	"Return a set containing the static variable names (as string) of aClass and all its super classes until the Cormas entity classes."
	
	| set |
	set := OrderedCollection new.	"Add the class variables"
	set addAll: aClass class instVarNames.	"list addAll: aClass classVarNames."	"ne marche pas !"	"and add attributs superclasses except from Entities"
	set addAll: (self inheritedInstVarNamesForClass: aClass class).
	set
		remove: 'CurrentId'
		ifAbsent: [].
	^set