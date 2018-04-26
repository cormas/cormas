initialization
initializeWidgets
	" Private - See superimplementor's comment "

	self
		instantiateModels: #(
			setterAccessorCheckbox 	CheckBoxModel 
			getterAccessorCheckbox 	CheckBoxModel 
			notifyObsCheckbox 			CheckBoxModel 
			initialRBGroup 				CMSpecInitialValueSetter			
			toolbar 						SpcTwoButtonToolbar).
									
	self initializeLabels.
	self initializeFocus.