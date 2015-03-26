random
typeChanged
	
	| result |
	self typeOfValue value = #nilAsValue
		ifTrue:
			[self randomValueHolder value: nil.
			^self defaultValueHolder value: nil].
	self typeOfValue value = #fixedValue
		ifTrue: [^self randomValueHolder value: nil].
	result := self chooseRandomness.
	self randomValueHolder value: result.
	result ifNil: [^self typeOfValue value: #fixedValue].
	self defaultValueHolder value: nil