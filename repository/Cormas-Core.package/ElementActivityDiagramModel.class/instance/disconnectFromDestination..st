connection
disconnectFromDestination: destinationModel
	
	self removeOutgoing: destinationModel.
	destinationModel removeIncoming: self