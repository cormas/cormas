- accessing - methods & classes
allClassVariablesUntil: aSuperClass
	"Purpose: returns the list of ClassVariables of the receiver up to aSuperClass
Return value: an orderedCollection
Example: AgentLocation allClassVariablesUntil: Object"
	
	| coll |
	coll := OrderedCollection new.
	(self superClassesUntil: aSuperClass)
		do: [:cl | coll addAll: cl class instVarNames	"classVarNames"].
	^coll