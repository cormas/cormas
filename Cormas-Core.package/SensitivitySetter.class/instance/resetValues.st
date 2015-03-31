actions
resetValues
	
	(self classAttribValue_List list
		select: [:defAttrib | defAttrib hasBeenModified]) do: [:cav | cav reset].
	parametersToAnalyse := nil.
	self classAttribValue_List list: self classAttribValue_List list