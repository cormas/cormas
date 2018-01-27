access methods
defaultInfoFor: aClass
	
	(self defaultInfo keys includes: aClass)
		ifFalse: [self defaultInfo at: aClass put: nil].
	^self defaultInfo at: aClass