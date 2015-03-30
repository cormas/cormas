- activityDiagram
removeActivityDiagram: instanceOperationName
	"Removes the diagram store into activityDiagrams dictionnary, but also deletes the 2 methods defining the diagram"
	
	self activityDiagrams
		removeKey: instanceOperationName
		ifAbsent: [nil].
	(methodDict includesKey: instanceOperationName)
		ifFalse:
			[self cormas
				warn:
					'The #<1s> belongs to a super class.<n>Please remove it from this super class'
				with: instanceOperationName asString.
			^nil].
	self removeSelector: instanceOperationName asSymbol.
	self class
		removeSelector:
			(self preStringForActivitySelector , instanceOperationName asString)
				asSymbol