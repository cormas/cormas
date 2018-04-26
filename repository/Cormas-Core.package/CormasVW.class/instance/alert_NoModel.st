user messages
alert_NoModel
	
	^self
		warn: (UserMessage defaultString: ' Create a new model ! ' key: #noModel)