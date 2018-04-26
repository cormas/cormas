initialization
initializeWidgets
	" Private - See superimplementor's comment "

	self povDefinition: (CMSpecPovDefinition for: self projectManager).
	self povInfo: (CMSpecPovInfo for: self projectManager).
	self instantiateModels: #(
		povDefinitionLabel	 	LabelModel
		povInfoLabel 			LabelModel
		setColorLabel 			LabelModel
		povColorButton 			SpcColorChooserModel
		applyButton				ButtonModel
"		toolbar 				SpcOneButtonToolbar").

	self povDefinitionLabel label: self translator tPoVDefinition.
	self povInfoLabel label: self translator tPoVInfoDisplayed.
	self setColorLabel label: self translator tPoVSetColor.
	self applyButton label: self translator tApply.
