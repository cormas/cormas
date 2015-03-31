user message
confirm: aMessage
	"display a message for this window"
	
	^Dialog
		confirm: aMessage
		for: self mainWindow