model entities
addNewClassType: aType inheritingFrom: aSuperclass defaultName: aString
	
	^self addNewClassType: aType inheritingFrom: aSuperclass defaultName:
			aString initProtocol: false stepProtocol: false