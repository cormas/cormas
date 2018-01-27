debuging
checkDefaultValue: methodsList exists_dialogConfirmTypeName: defaultListName
	| defValue |
	(self perform: methodsList) keys
		do: [ :aClass | 
			defValue := (self perform: methodsList) at: aClass.
			defValue
				ifNil: [ (self perform: methodsList) removeKey: aClass ]
				ifNotNil: [ (aClass allInstanceSelectors includes: defValue)
						ifFalse: [ (self
								confirm: (self confirmRemove: defValue list: aClass class: defaultListName))
								ifTrue: [ (self perform: methodsList) remove: aClass ] ] ] ]