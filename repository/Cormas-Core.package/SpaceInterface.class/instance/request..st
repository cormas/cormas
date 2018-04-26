user message
request: aMessage
	"display a message for this window"
	
	^Dialog
		request: aMessage
		for: self mainWindow