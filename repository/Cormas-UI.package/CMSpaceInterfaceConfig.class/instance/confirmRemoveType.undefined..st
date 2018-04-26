debuging
confirmRemoveType: typeName undefined: undefined
	^ 'The ' , typeName , ' ' , undefined printString
		,
			' defined in the Habitus do not exist in the model.
Do you want to remove them (recommended)?

If you accept, even if the obsolete ' , typeName
		,
			' are removed, you need to reopen the Habitus interface to see the changes appear'