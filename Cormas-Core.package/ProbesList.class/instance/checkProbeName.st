user messages
checkProbeName
	"^'This is already an instance variable name !\Enter another name please !'
		withCRs"
	
	^UserMessage
		defaultString:
			'This is already an instance variable name !\Enter another name please !'
				withCRs
		key: #checkProbeName