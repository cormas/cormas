connection
connectTo: destinationModel
	
	self outgoing add: destinationModel.
	destinationModel incoming add: self