aspects
data
	
	^data isNil
		ifTrue: [data := List new asValue]
		ifFalse: [data]