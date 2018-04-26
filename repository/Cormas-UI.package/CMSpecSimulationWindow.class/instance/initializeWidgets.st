initialization
initializeWidgets
	" Private - See superimplementor's comment "

	self instantiateModels: #(
		simulateLabel			LabelModel		
		replayLabel				LabelModel		
		initializeLabel			LabelModel		
		backwardLabel			LabelModel		
		currentStepLabel		LabelModel		
		finalStepLabel 			LabelModel
		forwardLabel				LabelModel
		currentStepInputText	TextInputFieldModel					
		finalStepInputText		TextInputFieldModel
		changeButton				ButtonModel
		closeButton 				ButtonModel).
	self initializeFocus.
	self initializeLabels.

	self changeButton label: self translator tChange.

	self closeButton
		icon: #smallCancelIcon asIcon;
		action: [ self delete ];
		help: self translator tSimCloseHelp.

	self currentStepInputText
		text: 0;
		help: self translator tSimStepHelp.

	self finalStepInputText
		text: 0;
		help: self translator tSimFinalStepHelp

