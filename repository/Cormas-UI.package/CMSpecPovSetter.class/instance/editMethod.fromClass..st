action
editMethod: aSelector fromClass: aClass
	
	| browser |
	browser := Nautilus open.
	browser selectedClass: aClass.
	browser showHierarchy.
	browser selectedMethod: aSelector