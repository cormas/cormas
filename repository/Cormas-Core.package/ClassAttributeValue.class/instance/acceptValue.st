actions
acceptValue
	
	| value |
	value := self defaultValueHolder value.
	self typeOfValue value = #randomValue
		ifFalse:
			[self valueType: value class.
			self currentValue: value].
	self hasBeenModified: true	"	self closeAndUnschedule.
	^self closeRequest"