testing
isAnalysisDone
	"answer if currentValue is upper than the final value"
	
	self currentValue isNil ifTrue: [^false].
	^self currentValue = self distributionList last