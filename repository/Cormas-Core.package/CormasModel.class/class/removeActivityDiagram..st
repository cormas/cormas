- activityEditor
removeActivityDiagram: instanceOperationName
	"Removes the diagram store into activityDiagrams dictionnary, but also deletes the 2 methods defining the diagram"
	
	self activityDiagrams
		removeKey: instanceOperationName
		ifAbsent: [nil].
	self removeSelector: instanceOperationName asSymbol.
	self class
		removeSelector:
			(self preStringForActivitySelector , instanceOperationName asString)
				asSymbol