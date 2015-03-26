interface closing
requestForWindowClose
	
	| listCAVs |
	listCAVs := self classAttribValue_List list
		select: [:defAttrib | defAttrib hasBeenModified].
	listCAVs isEmpty ifFalse: [self confirmDoSave ifFalse: [^false]].
	^super requestForWindowClose