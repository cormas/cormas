binary storage
representBinaryOn: binWriter
	
	^MessageSend
		receiver: self class
		selector: #on:
		argument: image