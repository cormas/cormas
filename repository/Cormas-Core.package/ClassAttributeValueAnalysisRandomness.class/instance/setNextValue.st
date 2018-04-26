controlling
setNextValue
	"This method calculates the new value of a parameter."
	
	self isAnalysisDone ifTrue: [^nil].
	self repNb: self repNb + 1.
	self currentValue: self getRandomValue.
	Cormas initRandomSeed