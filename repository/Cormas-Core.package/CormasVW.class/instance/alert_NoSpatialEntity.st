user messages
alert_NoSpatialEntity
	
	^self
		warn:
			(UserMessage defaultString: ' No spatial entity ! ' key: #noSpatialEntity)