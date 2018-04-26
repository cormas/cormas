initialization
setGroup
	" Group receiver's radio buttons "

	RadioButtonGroupModel new
		addRadioButton: buttonObject;
		addRadioButton: buttonLocatedObject;
		addRadioButton: buttonNetworkNode;
		addRadioButton: buttonNetworkArc;
		addRadioButton: buttonFullNetwork;
		addRadioButton: buttonMessage;
		default: buttonObject.

