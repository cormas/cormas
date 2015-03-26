controlling
setNextValue
	"This method calculates the new value of a parameter. 
	For avoiding problems of flotting numbers (Cf. The gohst in the model), currentValue, step, nextValue & finalValue are stored as Rational numbers. We thus avoid accumulating a delta to minimize round-off error."
	
	| currentRational stepRational nextRational |
	self currentValue ifNil: [^self currentValue: self initValue].
	self isAnalysisDone ifTrue: [^nil].
	currentRational := self currentValue asRational.
	stepRational := self step asRational.
	nextRational := currentRational + stepRational.
	self step sign * nextRational >= (self step sign * self finalValue)
		ifTrue: [nextRational := self finalValue].
	nextRational isInteger
		ifTrue: [self currentValue: nextRational]
		ifFalse: [self currentValue: nextRational asFloat].
	^nextRational