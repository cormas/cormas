user messages
alert_NameAlreadyExist
	
	^self
		warn: (UserMessage defaultString: ' Already used ! ' key: #alreadyUsed)