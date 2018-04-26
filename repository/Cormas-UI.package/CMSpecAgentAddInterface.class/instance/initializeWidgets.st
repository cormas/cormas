initialization
initializeWidgets
	" Private - See superimplementor's comment "

	self instantiateModels: #(
		cbComm 					CheckBoxModel
		cbGroup 					CheckBoxModel
		cbLocation 				CheckBoxModel					 
		newClassName 			SpcLabeledTextField 
		descriptionLabel 		LabelModel 
		toolbar 					SpcOneButtonToolbar).

	self newClassName 
		beForText;
		label: 'Name:'.
	self cbComm label: self translator tCommunication.
	self cbGroup label: self translator tGroup.
	self cbLocation label: self translator tLocation.
	self toolbar firstButtonLabel: 'Ok'.
	self focusOrder
		add: self cbComm;
		add: self cbGroup;
		add: self cbLocation;
		add: self newClassName;
		add: self descriptionLabel;
		add: self toolbar