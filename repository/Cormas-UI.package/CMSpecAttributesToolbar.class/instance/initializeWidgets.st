initialization
initializeWidgets
	" Private - See superimplementor's comment "

	self
		instantiateModels: #(
			attributeLabel 				LabelModel 
			attributeAddButton 		ButtonModel 
			attributeRemoveButton 	ButtonModel 
			classVarLabel 				LabelModel 
			classVarAddButton 			ButtonModel 
			classVarRemoveButton 		ButtonModel).
	
	self initializeLabels.
	self initializeFocus.
