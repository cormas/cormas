event
classListChanged
	"Display the list of attributs of the selected class in the 
	attributsList"
	
	| liste |
	selectedClass := classesList selection.
	selectedClass
		ifNil: [attributsList list: List new]
		ifNotNil:
			[liste := List new.
			liste
				addAll:
					(DefaultAttributesSetter getAllAttributsFromClass: selectedClass).
			attributsList list: liste]