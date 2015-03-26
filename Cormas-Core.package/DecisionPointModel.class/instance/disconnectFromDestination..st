connection
disconnectFromDestination: destinationModel
	
	destinationModel = outgoingFalse ifTrue: [outgoingFalse := nil].
	destinationModel = outgoingTrue ifTrue: [outgoingTrue := nil].
	destinationModel incoming remove: self