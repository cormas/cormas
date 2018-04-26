connection
connectToDestinationFalse: destinationModel
	
	self outgoingFalse isNil ifFalse: [self halt].
	self outgoingFalse: destinationModel.
	destinationModel incoming add: self