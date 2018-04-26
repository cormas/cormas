debuging
confirmRemoveMethods: methodsName inClass: aClass undefined: undefined
	^ 'The ' , methodsName , ' ' , undefined printString , ' of class '
		, aClass name
		,
			' defined in the Habitus do not exist in the model.
Do you want to remove them (recommended)?

If you accept, even if the obsolete ' , methodsName
		, ' are removed, you need to re-display the ' , methodsName
		, ' list, to see the changes appear'