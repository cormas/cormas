compiling
compileDefaultValue
	"Save definitively the changed parameters with the Initial value: compiles the attribute reader accessor and compiles the attribute_default method"
	
	self createAttribute.
	self valueType = Random ifTrue: [self addRandomAttribute].	"Building the Setter method code"
	self setterAccessor value
		ifTrue:
			[self setNotification value
				ifFalse:
					[DefaultAttributesSetter
						defineSetterMethod: self targetAttribute
						ofClass: self targetClass
						protocol: 'accessing']
				ifTrue:
					[DefaultAttributesSetter
						defineSetterMethodWithObserverNotification: self targetAttribute
						ofClass: self targetClass
						protocol: 'accessing']].	"Building the getter method code"	"self getterAccessor value ifFalse: [^nil] on interdit de ne pas avoir de getter"	"Warning accessor already exist"	"getterMethod := self targetAttribute asSymbol.
	(self targetClass canUnderstand: getterMethod)
		ifTrue:
			[(self confirmRedefine) ifFalse: [^nil]]."
	DefaultAttributesSetter defineGetterMethodFrom: self protocol: 'accessing'.
	DefaultAttributesSetter
		defineDefaultClassMethod: self targetAttribute
		ofClass: self targetClass
		withDefaultValue: self currentValue.
	self setAttributeNewValue