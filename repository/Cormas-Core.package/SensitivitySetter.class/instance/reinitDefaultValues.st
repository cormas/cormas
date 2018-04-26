initialize-release
reinitDefaultValues
	"reset the current values of the parameters to their default values"
	
	(self classAttribValue_List list
		select: [:defAttrib | defAttrib hasBeenModified]) isEmpty
		ifFalse:
			[self confirmBackToDefaultValues ifTrue: [self backToDefaultValues]].
	self classAttribValueAnalysis_List list
		do: [:defAttrib | defAttrib hasBeenModified: true]