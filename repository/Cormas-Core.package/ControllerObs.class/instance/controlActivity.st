accessing
controlActivity
	
	self sensor redButtonPressed
		ifTrue:
			[self model performRedButton: self sensor cursorPoint.
			^self].
	self sensor yellowButtonPressed ifTrue: [self yellowButtonActivity].
	self sensor blueButtonPressed ifTrue: [self openSecondMenu]