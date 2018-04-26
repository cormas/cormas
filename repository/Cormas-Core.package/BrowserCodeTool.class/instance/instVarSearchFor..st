autocomplete extension
instVarSearchFor: aParagraphEditor
	
	^self classOrNameSpace
		ifNotNil:
			[:targetClass | InstanceVariableSearch targetClass: targetClass]