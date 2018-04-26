setParameters
setNextAttributeValue
	"Set the next value of the current analysed attribute. Then set all the attributes to their Initial values"
	
	| undoneParameters |
	undoneParameters := self parametersToAnalyse
		select: [:cav | cav isAnalysisDone not].	"Test if analysis ended"
	undoneParameters isEmpty ifTrue: [^nil].	"sinon on augmente le dernier parametre augmentable et on r√©initialise les suivants"
	self currentAnalysedAttribute: undoneParameters last.
	self currentAnalysedAttribute setNextValue.
	1 + (self parametersToAnalyse indexOf: currentAnalysedAttribute)
		to: self parametersToAnalyse size
		do: [:i | (self parametersToAnalyse at: i) initializeCurrentValue].
	self applyNewValues.	"refresh"
	self classAttribValueAnalysis_List list: self parametersToAnalyse