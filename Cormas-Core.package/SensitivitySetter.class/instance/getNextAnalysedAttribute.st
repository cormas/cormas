setParameters
getNextAnalysedAttribute
	"Get the next analysed attribute from parametersToAnalyse"
	
	| i newCAV |
	self currentAnalysedAttribute isAnalysisDone
		ifTrue:
			[self setDefaultValue: self currentAnalysedAttribute.
			i := self parametersToAnalyse indexOf: self currentAnalysedAttribute.
			i = self parametersToAnalyse size ifTrue: [^nil].
			newCAV := self parametersToAnalyse at: i + 1.
			newCAV currentValue: nil.
			^newCAV].
	^self currentAnalysedAttribute