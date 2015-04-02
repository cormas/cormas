user messages
alert_NoComEntity
	
	^self
		warn:
			(UserMessage defaultString: ' No communicating entity ! ' key:
					#noCommEntity)