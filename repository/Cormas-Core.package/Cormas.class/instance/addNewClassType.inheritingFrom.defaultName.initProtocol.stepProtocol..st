model entities
addNewClassType: aType inheritingFrom: aSuperclass defaultName: aString initProtocol: createInit stepProtocol: createStep
	
	^self
		addNewClassType: aType
		inheritingFrom: aSuperclass
		name: (self askUserTheClassNameWithDefaultValue: aString)
		initProtocol: createInit
		stepProtocol: createStep