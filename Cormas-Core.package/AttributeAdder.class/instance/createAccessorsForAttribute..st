actions_butons
createAccessorsForAttribute: variableName
	
	| needsGetter needsSetter getterMethod defaultValue |
	self openValueChooserInterface.
	self dialogValue cancel value ifTrue: [^nil].
	needsGetter := self getterAccessor value.
	needsSetter := self setterAccessor value.
	needsSetter
		ifTrue:
			[(targetClass canUnderstand: (variableName asString , ':') asSymbol)
				ifFalse: [self defineSetterMethod]].
	needsGetter ifFalse: [^nil].	"Warning accessor already exist"
	getterMethod := variableName asString asSymbol.
	(targetClass canUnderstand: getterMethod)
		ifTrue:
			[(self cormas
				confirm: 'Getter accessor already defined.\    Overwrite it  ?' withCRs)
				ifFalse: [^self]].	"Building the method code"
	defaultValue := self defaultValueHolder value.
	self class defineGetterMethod: variableName ofClass: targetClass
		withDefaultValue: defaultValue protocol: 'accessing'.
	^self