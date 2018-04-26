initialization
initializeFocusOrder

	self focusOrder
		add: self spatialList;
		add: self socialList;
		add: self passiveList;
		add: self defineEntitiesLabel
