- accessing - methods & classes
allClassVariablesUntilEntity
	"Purpose: returns the list of ClassVariables of the receiver up to aSuperClass
Return value: an orderedCollection
Example: AgentLocation allClassVariablesUntilEntity"
	
	^self allClassVariablesUntil: CMEntity