actions_butons
addClassVariable
	"	| variableName getterMethod defaultValue |"
	
	| variableName aCAV |
	variableName := self addClassVarDefaultName: ''.
	variableName ifNil: [^self].
	aCAV := self openValueChooserInterface.
	aCAV acceptValue.
	aCAV targetClass: targetClass class.
	aCAV targetAttribute: variableName asSymbol.
	self addCAV: aCAV.	"save automatically the default value of this new class variable"
	aCAV compileDefaultValue isNil ifFalse: [aCAV setAttributeNewValue].
	aCAV hasBeenModified: false	"variableName := self addClassVarDefaultName: ''.
	variableName = self ifTrue:[^self].
	self openValueChooserInterface."	"Building the Setter method code"	"self setterAccessor value ifTrue:[self class defineSetterMethod: variableName ofClass: targetClass class protocol: 'accessing']."	"Building the getter method code"	"defaultValue := self defaultValueHolder value.
	self getterAccessor value ifFalse: [^nil]."	"Warning accessor already exist"	"	getterMethod := variableName asString asSymbol.
	(targetClass class canUnderstand: getterMethod)
		ifTrue: [(Dialog confirm: ('Getter accessor already defined. \Overwrite it  ?' withCRs))
				ifFalse: [^self]]. 
	defaultValue := self defaultValueHolder value.
	self class defineGetterMethod: variableName ofClass: targetClass class withDefaultValue: defaultValue protocol: 'accessing'.
	^self addCAVfromClass: targetClass class attribute: getterMethod value: defaultValue"