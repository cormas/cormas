click
clicToChange
	
	| firstPatch valueToBeChanged |
	activeAttributeValue := self cormas
		request:
			(UserMessage defaultString: 'attribute value of ' key: #attributeValue)
				asString , self activeAttribute.
	activeAttributeValue isEmpty ifTrue: [^nil].
	firstPatch := (self spaceModel spatialEntities
		at: self model activeSpatialEntity name)
		detect: [:i | (i perform: self activeAttribute asSymbol) isNil not]
		ifNone:
			[(self spaceModel spatialEntities at: self model activeSpatialEntity name)
				first].
	valueToBeChanged := firstPatch perform: self activeAttribute asSymbol.
	valueToBeChanged isSymbol
		ifTrue: [activeAttributeValue := activeAttributeValue asSymbol].
	(valueToBeChanged isKindOf: Number)
		ifTrue:
			[(activeAttributeValue isKindOf: Number)
				ifFalse: [activeAttributeValue := activeAttributeValue asNumber]].
	(valueToBeChanged isKindOf: Boolean)
		ifTrue:
			[(activeAttributeValue isKindOf: Boolean)
				ifFalse: [activeAttributeValue := activeAttributeValue asBoolean]]