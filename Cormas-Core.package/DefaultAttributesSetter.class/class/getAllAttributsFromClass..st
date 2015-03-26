getAttributes
getAllAttributsFromClass: aClass
	"Return a list containing the static variable names (as string) + a separator string + the attributs names (as string) of aClass and all its super classes until
the Cormas entity classes.
!! All attributs without accessors are removed from the list "
	
	| list list2 |
	"Add the static variables"
	list := (self staticAttributsFromClass: aClass) asSortedCollection asList.	"Add a separator"
	list add: SimManager separator.	"Add the attributs"
	list2 := self attributsFromClass: aClass.
	list addAll: list2 asSortedCollection asList.
	^list