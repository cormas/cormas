initialization
initializeWidgets
	" Private - See superimplementor's comment "

	self instantiateModels: #(
		rbEntityElementType 	RadioButtonModel
		rbCellGroup 				SpcRadioButtonGroup
		rbConfigGroup 			SpcRadioButtonGroup
		entityName 				SpcLabeledTextField			
		toolbar 					SpcThreeButtonToolbar).

	self entityName label: self translator tName.
	self setFocus.
	self setToolbar.
	self initializeRbItems.