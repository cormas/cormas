testing
isAnalysisDone
	"answer if currentValue is upper than the final value"
	
	self currentValue isNil ifTrue: [^false].
	^self repNb = self repetitions