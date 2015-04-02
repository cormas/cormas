user messages
alert_NewModel
	
	^self
		warn:
			(UserMessage defaultString: 'Select or create a model' key: #noModel)