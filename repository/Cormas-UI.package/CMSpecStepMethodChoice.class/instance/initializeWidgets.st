initialization
initializeWidgets
	" Private - See superimplementor's comment "

	self instantiateModels: #(
		methodsLabeledList				SpcLabeledList		
		finalStepLabeledTextInput	SpcLabeledTextField
		randomnessCheckbox				CheckBoxModel
		toolbar 							SpcTwoButtonToolbar).
	self initializeFocus.
	
	self methodsLabeledList
		label: self translator tSelectMethod.
	self finalStepLabeledTextInput
		label: self translator tFinalStepChoice;
		text: '0'.
	self randomnessCheckbox 
		label: self translator tInitializeRandomness.