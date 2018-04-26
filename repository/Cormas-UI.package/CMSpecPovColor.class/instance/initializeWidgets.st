initialization
initializeWidgets
	" Private - See superimplementor's comment "

	self instantiateModels: #(
		colorChooser		SpcColorChooserModel		
		applyButton		ButtonModel
	).
	self initializeFocus.