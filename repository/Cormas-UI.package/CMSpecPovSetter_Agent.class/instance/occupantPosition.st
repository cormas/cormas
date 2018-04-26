aspects
occupantPosition
	
	^occupantPosition isNil
		ifTrue: [occupantPosition := #center asValue]
		ifFalse: [occupantPosition]