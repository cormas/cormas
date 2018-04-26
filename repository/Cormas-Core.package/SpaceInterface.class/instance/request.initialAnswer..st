user message
request: aMessage initialAnswer: initialString
	"display a message for this window"
	
	^Dialog
		request: aMessage
		initialAnswer: initialString
		for: self mainWindow