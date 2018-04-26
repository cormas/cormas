user messages
alert_singleView
	
	^self
		warn:
			(UserMessage defaultString: 'A single view is allowed !!!' key: #singleView)