actions
reApplyNewValues
	" set a the new values of the attributes whitout compiling the getter accessors"
	
	| aList |
	aList := self classAttribValue_List
		select:
			[:defAttrib | 
			defAttrib hasBeenModified
				or: [defAttrib targetClass = self cormasModel class]].
	aList do: [:aClassAttribValue | aClassAttribValue setAttributeNewValue]