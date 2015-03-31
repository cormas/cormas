actions
resetUncompleteAttributes
	
	| listAttributes unmodifiedAttributes |
	listAttributes := self classAttribValue_List list
		select: [:defAttrib | defAttrib hasBeenModified].
	unmodifiedAttributes := listAttributes
		select:
			[:defAttrib | defAttrib initValue isNil or: [defAttrib finalValue isNil]].
	unmodifiedAttributes do: [:defAttrib | defAttrib hasBeenModified: false].
	(self classAttribValue_List list
		select: [:defAttrib | defAttrib hasBeenModified not])
		do:
			[:defAttrib | 
			defAttrib
				initValue: nil;
				finalValue: nil;
				step: nil].
	self classAttribValue_List refreshList: self classAttribValue_List list