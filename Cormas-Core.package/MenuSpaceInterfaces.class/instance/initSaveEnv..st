initialize-release
initSaveEnv: model
	
	| liste |
	liste := List new.
	liste addAllFirst: model cellClass instVarNames.
	(model cellClass inheritsFrom: SpatialEntityCell)
		ifTrue: [liste addFirst: 'state'].
	attributesToBeSaved := MultiSelectionInList new list: liste.
	attributesToBeSaved selectAll.
	self envFilename value: 'filename.env'