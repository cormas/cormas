initialize-release
initSaveASC: model
	
	| liste |
	liste := List new.
	liste addAllFirst: model cellClass instVarNames.
	(model cellClass inheritsFrom: SpatialEntityCell)
		ifTrue: [liste addFirst: 'state'].
	attributesSavedASC := MultiSelectionInList new list: liste.
	attributesSavedASC selectAll