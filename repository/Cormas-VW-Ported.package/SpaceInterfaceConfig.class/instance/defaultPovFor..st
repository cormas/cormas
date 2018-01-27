access methods
defaultPovFor: aClass
	
	(self defaultPov keys includes: aClass)
		ifFalse: [self defaultPov at: aClass put: nil].
	^self defaultPov at: aClass