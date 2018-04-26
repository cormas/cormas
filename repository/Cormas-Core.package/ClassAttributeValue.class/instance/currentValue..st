accessing
currentValue: anObject
	"self hasBeenModified: (currentValue = anObject) not."
	
	currentValue := anObject.
	self valueType = Random ifFalse: [valueType := anObject class].
	^anObject