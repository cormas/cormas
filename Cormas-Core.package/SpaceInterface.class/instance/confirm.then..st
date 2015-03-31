user message
confirm: aMessage then: aBlock
	"display a message for this window"
	
	[(Dialog
		confirm: aMessage
		for: self mainWindow) ifTrue: [aBlock value]] promise