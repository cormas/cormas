testing
isAnalysisDone
	"answer if currentValue is upper than the final value"
	
	self currentValue isNil ifTrue: [^false].
	^self step > 0
		ifTrue: [self currentValue >= self finalValue]
		ifFalse: [self currentValue <= self finalValue]