click
clicToChangeAttribute: aSymbol withValue: aValue
	
	| anInstance valueToBeChanged |
	activeAttribute := aSymbol.
	activeAttributeValue := aValue.
	anInstance := self allEntityFiguresAt: self manipulatedEntity.
	anInstance isEmpty ifTrue: [^nil].
	anInstance := anInstance first model entity copy.
	valueToBeChanged := anInstance perform: self activeAttribute asSymbol.
	valueToBeChanged isSymbol
		ifTrue: [^activeAttributeValue := activeAttributeValue asSymbol].
	valueToBeChanged cormasHelper isTypeNumber
		ifTrue:
			[activeAttributeValue cormasHelper isTypeNumber
				ifFalse: [^activeAttributeValue := activeAttributeValue asNumber]].
	valueToBeChanged cormasHelper isTypeBoolean
		ifTrue:
			[activeAttributeValue cormasHelper isTypeBoolean
				ifFalse: [activeAttributeValue := activeAttributeValue asBoolean]]