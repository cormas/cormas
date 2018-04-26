initialization
initializeWidgets
	" Private - See superimplementor's comment "

	self instantiateModels: #(
		rbTypeGroup 				CMSpecPassiveAddRBGroup
		entityName 				SpcLabeledTextField			
		toolbar 					SpcOneButtonToolbar).

	self entityName label: self translator tName.
	self setFocus.
	self setToolbar.
	self initializeRbItems.