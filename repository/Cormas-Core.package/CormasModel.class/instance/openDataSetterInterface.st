default values
openDataSetterInterface
	
	defaultAttributesSetter
		ifNil: [defaultAttributesSetter := ParameterInterface newOn: self].
	(defaultAttributesSetter isKindOf: ParameterInterface)
		ifFalse:
			[defaultAttributesSetter := ParameterInterface newFromPreviousSetter:
					defaultAttributesSetter].
	self defaultAttributesSetter mainWindow isNil
		ifTrue: [^self defaultAttributesSetter open].
	self defaultAttributesSetter mainWindow isOpen
		ifTrue:
			[(self defaultAttributesSetter mainWindow)
				raise;
				expand]
		ifFalse: [self defaultAttributesSetter open]