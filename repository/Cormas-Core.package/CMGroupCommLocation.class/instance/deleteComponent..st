+ components - managing
deleteComponent: anItem
	"Purpose: remove IMMEDIATELY a given item from the group components
Argument: anItem = <Agent>"
	
	self components
		remove: anItem
		ifAbsent: []