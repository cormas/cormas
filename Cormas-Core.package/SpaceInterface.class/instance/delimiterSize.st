delimiteur
delimiterSize
	
	^delimiterSize isNil
		ifTrue: [delimiterSize := #pixel1 asValue]
		ifFalse: [delimiterSize]