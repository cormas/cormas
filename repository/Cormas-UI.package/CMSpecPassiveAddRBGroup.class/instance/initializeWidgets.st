initialization
initializeWidgets
	" Private - See superimplementor's comment "

	self instantiateModels: #(
		buttonObject  				RadioButtonModel
		buttonLocatedObject 		RadioButtonModel
		buttonNetworkNode 			RadioButtonModel
		buttonNetworkArc 			RadioButtonModel
		buttonFullNetwork 			RadioButtonModel
		buttonMessage 				RadioButtonModel).
	self setFocus.
	self setGroup.