connection
isAlreadyConnected
	
	^(self model outgoingTrue isNil | self model outgoingFalse isNil) not