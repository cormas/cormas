connection
connectToDestination: destinationModel
	
	self outgoing add: destinationModel.
	destinationModel incoming add: self