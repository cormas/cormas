accessing
randomTypeChoices
	
	^randomTypeChoices isNil
		ifTrue: [randomTypeChoices := List new asValue]
		ifFalse: [randomTypeChoices]