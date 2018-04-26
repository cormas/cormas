debuging
checkHabitusList: aHabitusMethodList existsIn: modelList dialogConfirmTypeName: typeName
	| undefined |
	undefined := Set new.
	(self perform: aHabitusMethodList) list
		do: [ :e | 
			((self perform: modelList) includes: e)
				ifFalse: [ undefined add: e ] ].
	undefined isEmpty
		ifFalse: [ (self
				confirm: (self confirmRemoveType: typeName undefined: undefined))
				ifTrue: [ (self perform: aHabitusMethodList) removeAll: undefined ] ]