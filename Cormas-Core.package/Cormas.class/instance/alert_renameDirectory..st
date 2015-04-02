user messages
alert_renameDirectory: aName
	
	^self
		warn:
			(UserMessage defaultString:
					'The directory name should start with an Uppercase.\It has been renamed as '
				key: #directoryNameWithUppercase) asString withCRs , aName