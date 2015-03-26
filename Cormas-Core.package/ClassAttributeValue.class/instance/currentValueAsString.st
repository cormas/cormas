access as String
currentValueAsString
	
	(currentValue isKindOf: ClassAttributeValue) ifTrue: [^nil].
	self currentValue isSymbol ifTrue: [^self currentValue printString].
	self currentValue isString ifTrue: [^self currentValue printString].
	^self currentValue asString