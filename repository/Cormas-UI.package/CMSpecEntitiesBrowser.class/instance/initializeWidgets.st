initialization
initializeWidgets
	" Private - See superimplementor's comment "
	
	self
		instantiateModels: #(
			spatialList 				SpcActionList 
			socialList 				SpcActionList 
			passiveList 				SpcActionList 
			defineEntitiesLabel 	LabelModel).

	self defineEntitiesLabel label: self translator tDefineEntities.
	self spatialList label: self translator tSpatial.
	self socialList label: self translator tSocial.
	self passiveList label: self translator tPassive.

	self initializeMenuItems.
	self initializeFocusOrder.
	self initializeListsContents.

