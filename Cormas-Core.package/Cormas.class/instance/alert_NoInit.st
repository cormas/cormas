user messages
alert_NoInit
	
	^self
		warn:
			(UserMessage defaultString: ' Select an initialization method ! ' key:
					#noInit)