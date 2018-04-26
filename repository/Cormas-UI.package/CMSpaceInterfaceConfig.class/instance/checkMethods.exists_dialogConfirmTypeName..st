debuging
checkMethods: methodsList exists_dialogConfirmTypeName: methodsName
	| undefined |
	methodsList = #defaultPov
		ifTrue: [ self halt ].
	(self perform: methodsList)
		keysDo: [ :aClass | 
			undefined := Set new.
			((self perform: methodsList) at: aClass)
				do: [ :aM | 
					(aClass allInstanceSelectors includes: aM asSymbol)
						ifFalse: [ undefined add: aM ] ].
			undefined isEmpty
				ifFalse: [ (self
						confirm:
							(self
								confirmRemoveMethods: methodsName
								inClass: aClass
								undefined: undefined))
						ifTrue: [ ((self perform: methodsList) at: aClass) removeAll: undefined ] ] ]