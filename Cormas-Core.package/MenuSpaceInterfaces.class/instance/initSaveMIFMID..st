initialize-release
initSaveMIFMID: class
	
	| liste |
	classMIFMID := class.
	liste := List new.
	liste addAllFirst: class instVarNames.
	liste addFirst: 'id'.
	(class inheritsFrom: SpatialEntityCell) ifTrue: [liste addFirst: 'state'].
	attributeSavedMIFMID := MultiSelectionInList new list: liste