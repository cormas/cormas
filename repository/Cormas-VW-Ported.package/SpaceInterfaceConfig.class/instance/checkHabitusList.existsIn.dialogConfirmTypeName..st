debuging
checkHabitusList: aHabitusMethodList existsIn: modelList dialogConfirmTypeName: typeName
	
	| undefined |
	undefined := Set new.
	(self perform: aHabitusMethodList) list
		do:
			[:e | ((self perform: modelList) includes: e) ifFalse: [undefined add: e]].
	undefined isEmpty
		ifFalse:
			[(Dialog
				confirm:
					'The ' , typeName , ' ' , undefined printString ,
							' defined in the Habitus do not exist in the model.
Do you want to remove them (recommended)?

If you accept, even if the obsolete ' , typeName ,
							' are removed, you need to reopen the Habitus interface to see the changes appear')
				ifTrue: [(self perform: aHabitusMethodList) removeAll: undefined]]