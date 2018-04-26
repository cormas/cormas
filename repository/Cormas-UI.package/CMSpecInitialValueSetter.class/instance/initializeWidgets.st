initialization
initializeWidgets

	self
		instantiateModels: #(
			initialValueLabel 			LabelModel		
			numberRadioButton 			SpcRadioButtonModel
			numberTextField 			TextInputFieldModel						
			randomRadioButton 			SpcRadioButtonModel
			randomTextField 			TextInputFieldModel
			booleanRadioButton 		SpcRadioButtonModel
			booleanList 					DropListModel					
			stringRadioButton 			SpcRadioButtonModel
			stringTextField 			TextInputFieldModel						
			collectionRadioButton 	SpcRadioButtonModel
			collectionList				DropListModel
			arrayRadioButton 			SpcRadioButtonModel
			arrayTextField 				TextInputFieldModel
			newEntityRadioButton 		SpcRadioButtonModel
			newEntityTextField 		TextInputFieldModel			
			noValueRadioButton			SpcRadioButtonModel).
						
	self initializeLabels.
	self setFocus.
	self setGroup