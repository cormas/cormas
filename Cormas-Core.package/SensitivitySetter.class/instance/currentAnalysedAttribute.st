setParameters
currentAnalysedAttribute
	"Get the current analysed attribute from parametersToAnalyse"
	
	currentAnalysedAttribute
		ifNil:
			[self parametersToAnalyse isEmpty ifTrue: [^nil].
			currentAnalysedAttribute := self parametersToAnalyse first.
			currentAnalysedAttribute currentValue: nil].
	^currentAnalysedAttribute