actions_elementaries
applyNewValue: aClassAttribValue
	" set a the new value of the attribute of aClassAttribValue.
	The attributes of the existing objects are associated to the new values and the attributes accessors are redefined.
	Note that the default value accessors at class level are not redefined"
	"Compatibility with previous Cormas version: before changing, it tests if the default class method exists otherwise compiles it"
	
	DefaultAttributesSetter
		getDefaultValueOfAttribut: aClassAttribValue targetAttribute
		ofClass: aClassAttribValue targetClass.
	aClassAttribValue setAttributeNewValue.
	(aClassAttribValue currentValue isKindOf: Dictionary)
		ifTrue:
			[^DefaultAttributesSetter
				defineGetterMethod: aClassAttribValue targetAttribute
				ofClass: aClassAttribValue targetClass
				withDefaultDictionary: aClassAttribValue currentValue
				protocol: 'accessing'].
	DefaultAttributesSetter
		defineGetterMethod: aClassAttribValue targetAttribute
		ofClass: aClassAttribValue targetClass
		withDefaultValue: aClassAttribValue currentValue
		protocol: 'accessing'