user messages
alert_NewCell
	
	^self
		warn: (UserMessage defaultString: ' define a cell !  ' key: #newCell)