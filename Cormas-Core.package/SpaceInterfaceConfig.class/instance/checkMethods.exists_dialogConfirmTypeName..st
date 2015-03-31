debuging
checkMethods: methodsList exists_dialogConfirmTypeName: methodsName
	
	| undefined |
	methodsList = #defaultPov ifTrue: [self halt].
	(self perform: methodsList) keys
		do:
			[:aClass | 
			undefined := Set new.
			((self perform: methodsList) at: aClass)
				do:
					[:aM | 
					(aClass allInstanceSelectors includes: aM asSymbol)
						ifFalse: [undefined add: aM]].
			undefined isEmpty
				ifFalse:
					[(Dialog
						confirm:
							'The ' , methodsName , ' ' , undefined printString , ' of class '
								, aClass name ,
									' defined in the Habitus do not exist in the model.
Do you want to remove them (recommended)?

If you accept, even if the obsolete ' , methodsName ,
									' are removed, you need to re-display the ' , methodsName ,
									' list, to see the changes appear')
						ifTrue:
							[((self perform: methodsList) at: aClass) removeAll: undefined]]]