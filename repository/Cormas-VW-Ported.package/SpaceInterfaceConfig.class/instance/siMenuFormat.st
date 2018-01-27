accessing
siMenuFormat
	
	^siMenuFormat isNil
		ifTrue: [siMenuFormat := #siMenuFull asValue]
		ifFalse: [siMenuFormat]