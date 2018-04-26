actions_elementaries
setDefaultValue: aClassAttribValue
	" set a the default value of the attribute into aClassAttribValue .
	The attributes of the existing objects are associated to the default values and the attributes accessors are redefined using the default value accessors at class level"
	
	| defaultValue |
	defaultValue := DefaultAttributesSetter
		getDefaultValueOfAttribut: aClassAttribValue targetAttribute
		ofClass: aClassAttribValue targetClass.
	(defaultValue isKindOf: Dictionary)
		ifTrue: [defaultValue isEmpty ifFalse: [^self]].
	DefaultAttributesSetter
		defineGetterMethod: aClassAttribValue targetAttribute
		ofClass: aClassAttribValue targetClass
		withDefaultValue: defaultValue
		protocol: 'accessing'.
	aClassAttribValue currentValue: defaultValue.	"aClassAttribValue setAttributInitialValue."
	aClassAttribValue hasBeenModified: false.
	aClassAttribValue setAttributeNewValue