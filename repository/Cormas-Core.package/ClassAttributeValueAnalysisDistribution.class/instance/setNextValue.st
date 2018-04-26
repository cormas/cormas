controlling
setNextValue
	"This method calculates the new value of a parameter."
	
	self currentValue ifNil: [^self currentValue: self distributionList first].
	self isAnalysisDone ifTrue: [^nil].
	self
		currentValue:
			(self distributionList
				at: (self distributionList indexOf: self currentValue) + 1)