access methods
canChangeValuesFor: aClass
	
	(self canChangeValues keys includes: aClass)
		ifFalse: [self canChangeValues at: aClass put: true].
	^self canChangeValues at: aClass