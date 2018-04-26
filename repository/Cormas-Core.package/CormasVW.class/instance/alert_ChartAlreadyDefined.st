user messages
alert_ChartAlreadyDefined
	
	^self
		warn:
			(UserMessage defaultString: 'Already defined ! ' key: #chartDefined)