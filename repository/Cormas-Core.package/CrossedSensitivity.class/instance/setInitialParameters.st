setParameters
setInitialParameters
	"Set the initial values of the analysed attributes but the last one (that will be initialized at #setNextAttributeValue)"
	
	self parametersToAnalyse do: [:cav | cav initializeCurrentValue].
	self parametersToAnalyse last currentValue: nil.	"refresh"
	self classAttribValueAnalysis_List list: self parametersToAnalyse