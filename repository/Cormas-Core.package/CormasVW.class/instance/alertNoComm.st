user messages
alertNoComm
	
	^self
		warn:
			(UserMessage defaultString: ' No communicating entity ! ' key:
					#noCommEntity)