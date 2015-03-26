connection
connectToDestinationTrue: destinationModel
	
	self outgoingTrue isNil ifFalse: [self halt].
	self outgoingTrue: destinationModel.
	destinationModel incoming add: self