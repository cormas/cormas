initialize-release
initSaveRSTRDC: model
	
	| liste |
	liste := List new.
	liste addAllFirst: model cormasModelClass cellClass instVarNames.
	(model cormasModelClass cellClass inheritsFrom: SpatialEntityCell)
		ifTrue: [liste addFirst: 'state'].
	line := model line asValue.
	column := model column asValue.
	attributesSavedRSTRDC := MultiSelectionInList new list: liste.
	attributesSavedRSTRDC selectAll