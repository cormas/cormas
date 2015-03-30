setParameters
setNextAttributeValue
	"Set the next value of the current analysed attribute. Then set all the attributes to their Initial values"
	
	self currentAnalysedAttribute: self getNextAnalysedAttribute.
	currentAnalysedAttribute ifNil: [^nil].
	self currentAnalysedAttribute setNextValue.
	self applyNewValues.	"refresh"
	self classAttribValueAnalysis_List list: self parametersToAnalyse