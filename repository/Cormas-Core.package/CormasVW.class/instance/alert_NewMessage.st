user messages
alert_NewMessage
	
	^self
		warn:
			(UserMessage defaultString: ' Give a new message !  ' key: #newMessage)