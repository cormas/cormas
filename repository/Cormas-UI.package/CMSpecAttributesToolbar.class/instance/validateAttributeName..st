initialization
validateAttributeName: userAnswer
	" Answer <true> if provided userAnswer is valid as attribute name "

	^ userAnswer notNil and: [ userAnswer notEmpty and: 
		[ userAnswer isValidInstVarName ] ]