attirance
valAtt: unAgent
	
	nbAmis = 0
		ifTrue: [^0]
		ifFalse: [^(preferences at: unAgent) pref / nbAmis]