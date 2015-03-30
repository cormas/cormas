accessing
currentCol: aString
	
	aString = '[A' ifTrue: [self halt].
	currentCol := aString