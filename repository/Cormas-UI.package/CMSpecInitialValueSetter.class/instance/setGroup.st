initialization
setGroup

	RadioButtonGroupModel new
		addRadioButton: numberRadioButton;
		addRadioButton: randomRadioButton;
		addRadioButton: booleanRadioButton;
		addRadioButton: stringRadioButton;
		addRadioButton: collectionRadioButton;
		addRadioButton: arrayRadioButton;
		addRadioButton: newEntityRadioButton;
		addRadioButton: noValueRadioButton;
		default: numberRadioButton.