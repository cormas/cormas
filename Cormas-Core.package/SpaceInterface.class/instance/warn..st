user message
warn: aMessage
	"display a message for this window. Don't block the current thread (usefull for remote dialog when distributed)"
	
	^self
		asynchronousDo:
			[Dialog
				warn: aMessage
				for: self mainWindow]