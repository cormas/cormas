helping
stringForDefaultValue: aDefaultValue
	"return a string that is used to save a default value depending on its type"
	
	aDefaultValue isEmpty
		ifTrue: [^aDefaultValue class name asString , ' new']
		ifFalse: [self halt]