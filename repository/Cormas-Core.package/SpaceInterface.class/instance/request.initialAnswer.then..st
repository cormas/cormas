user message
request: aMessage initialAnswer: initialString then: aBlock
	"request the user for this window then execute aBlock with the result, in an asynchrounous way.
	no result expected
	used for distributed cormas"
	
	| answer |
	[answer := Dialog
		request: aMessage
		initialAnswer: initialString
		for: self mainWindow.
	aBlock value: answer] promise