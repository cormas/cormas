user messages
alert_DefineAttribute
	
	^self
		warn:
			(UserMessage defaultString: ' Which attribute ! ' key: #attributeNoDefined)