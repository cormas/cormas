initialize-release
initSaveMIFMID: class
	
	| liste |
	classMIFMID := class.
	liste := List new.
	liste addAllFirst: class instVarNames.
	liste addFirst: 'id'.
	(class inheritsFrom: CMSpatialEntityCell) ifTrue: [liste addFirst: 'state'].
	attributeSavedMIFMID := MultiSelectionInList new list: liste