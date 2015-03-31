menu-display options
reopenSI
	
	| oldSI newSI |
	oldSI := self spaceInterface.
	newSI := self spaceInterface reopenWithSameHabitus.
	oldSI siConfig: nil.
	oldSI closeRequest.
	^newSI