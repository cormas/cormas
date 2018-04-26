accessing
modifiedAttribute
	
	^self classAttribValue_List list
		select: [:defAttrib | defAttrib hasBeenModified]