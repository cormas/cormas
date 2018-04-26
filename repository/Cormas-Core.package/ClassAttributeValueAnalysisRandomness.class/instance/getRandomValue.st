controlling
getRandomValue
	"This method calculates the new value of a parameter."
	
	| factor |
	(self randomType = 'random'
		or: [self randomType = '' or: [self randomType isNil]])
		ifFalse:
			["√† faire"
			self halt].
	factor := self initValue asRational denominator
		max: self finalValue asRational denominator.
	factor := factor * self repetitions.
	factor := 10 raisedTo: factor log ceiling.
	^((Cormas
		randomFrom: self initValue * factor
		to: self finalValue * factor) / factor) asFloat