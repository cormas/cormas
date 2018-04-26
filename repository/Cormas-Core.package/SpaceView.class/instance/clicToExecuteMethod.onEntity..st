click
clicToExecuteMethod: aSymbol onEntity: aClass
	
	| firstPatch valueToBeChanged |
	activeAttribute := aSymbol.
	firstPatch := (self spaceModel spatialEntities
		at: self model activeSpatialEntity name)
		detect: [:i | (i perform: self activeAttribute asSymbol) isNil not]
		ifNone:
			[(self spaceModel spatialEntities at: self model activeSpatialEntity name)
				first].
	valueToBeChanged := firstPatch perform: self activeAttribute asSymbol.
	valueToBeChanged isSymbol
		ifTrue: [activeAttributeValue := activeAttributeValue asSymbol].
	valueToBeChanged cormasHelper isTypeNumber
		ifTrue:
			[activeAttributeValue cormasHelper isTypeNumber
				ifFalse: [activeAttributeValue := activeAttributeValue asNumber]].
	valueToBeChanged cormasHelper isTypeBoolean
		ifTrue:
			[activeAttributeValue cormasHelper isTypeBoolean
				ifFalse: [activeAttributeValue := activeAttributeValue asBoolean]]