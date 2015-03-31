debuging
checkDefaultValue: methodsList exists_dialogConfirmTypeName: defaultListName
	
	| defValue |
	(self perform: methodsList) keys
		do:
			[:aClass | 
			defValue := (self perform: methodsList) at: aClass.
			defValue
				ifNil: [(self perform: methodsList) removeKey: aClass]
				ifNotNil:
					[(aClass allInstanceSelectors includes: defValue)
						ifFalse:
							[(Dialog
								confirm:
									'The ' , defaultListName , ' ' , defValue , ' of class ' , aClass name ,
											' defined in the Habitus does not exist in the model.
Do you want to remove it (recommended)?

If you accept, even if the obsolete ' , defaultListName ,
											' is removed, you need to re-display the ' , defaultListName ,
											' list, to see the changes appear')
								ifTrue: [(self perform: methodsList) remove: aClass]]]]