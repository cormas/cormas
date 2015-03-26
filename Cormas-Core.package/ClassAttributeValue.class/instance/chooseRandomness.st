random
chooseRandomness
	"Open a random dialog to choose the type of randomness (float or Integer) and to set the range limits"
	
	| dialogValue |
	dialogValue := SimpleDialog new.
	dialogValue openFor: self interface: #randomChooserWindow.
	dialogValue accept value ifFalse: [^nil].
	self minValueHolder value < self maxValueHolder value
		ifFalse:
			[Dialog warn: 'Low limit must be lower than the upper limit'.
			^self chooseRandomness].
	self valueType: Random.
	^self currentValue: self randomAsString