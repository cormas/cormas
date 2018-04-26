initialization
initializeWidgets
	" Private - See superimplementor's comment "
	
	self instantiateModels: #(
		versionName 			SpcLabeledTextField
		creationDate 		SpcLabeledTextField
		authorList 			CMGrowableAuthorList
		modelText 			SpcLabeledTextArea
		toolbar 				SpcOneButtonToolbar
		).
	self focusOrder 
		add: self authorList;
		add: self toolbar.