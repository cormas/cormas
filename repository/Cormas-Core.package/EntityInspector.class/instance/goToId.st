actions
goToId
	
	| nb |
	nb := Cormas current request: 'Enter id'.
	(nb isEmpty not and: [(nb contains: [:char | char isDigit not]) not])
		ifTrue:
			[nb := nb asNumber.
			self goToId: nb]