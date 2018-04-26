testing
isNbEntitiesToCreatePositive
	
	self numberEntitiesToCreate isNil ifTrue: [^true].
	^self numberEntitiesToCreate > 0