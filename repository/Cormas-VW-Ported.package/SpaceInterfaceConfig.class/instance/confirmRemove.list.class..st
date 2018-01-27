debuging
confirmRemove: defValue list: aClass class: defaultListName
	^ 'The ' , defaultListName , ' ' , defValue , ' of class '
		, aClass name
		,
			' defined in the Habitus does not exist in the model.
Do you want to remove it (recommended)?

If you accept, even if the obsolete ' , defaultListName
		, ' is removed, you need to re-display the ' , defaultListName
		, ' list, to see the changes appear'