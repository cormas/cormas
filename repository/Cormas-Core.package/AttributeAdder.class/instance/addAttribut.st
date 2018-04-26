actions_butons
addAttribut
	
	| variableName aCAV |
	variableName := self addAttributDefaultName: ''.
	variableName ifNil: [^self].
	aCAV := self openValueChooserInterface.
	aCAV acceptValue.
	aCAV targetAttribute: variableName asSymbol.
	self addCAV: aCAV.	"save automatically the default value of this new attribute"
	aCAV compileDefaultValue isNil ifFalse: [aCAV setAttributeNewValue].
	aCAV hasBeenModified: false	"Building the Setter method code"	"	self setterAccessor value ifTrue:[ 
		self setNotification value 
			ifFalse:[ self class defineSetterMethod: variableName ofClass: targetClass protocol: 'accessing'] 
			ifTrue:[ self class silentlyDefineSetterMethodWithObserverNotification: variableName ofClass: targetClass protocol: 'accessing']]."	"Building the getter method code"	"	self getterAccessor value ifFalse: [^nil] on interdit de ne pas avoir de getter"	"Warning accessor already exist"	"	getterMethod := variableName asString asSymbol.
	(targetClass canUnderstand: getterMethod)
		ifTrue: [(Dialog confirm: ('Getter accessor already defined. \Overwrite it  ?' withCRs))
				ifFalse: [^self]]. 
	defaultValue := self defaultValueHolder value.
	self class defineGetterMethod: variableName ofClass: targetClass withDefaultValue: defaultValue protocol: 'accessing'.
	^self addCAVfromClass: targetClass attribute: getterMethod value: defaultValue"