access methods
manipWholePopFor: aClass
	
	(self manipWholePop keys includes: aClass)
		ifFalse: [self manipWholePop at: aClass put: true].
	^self manipWholePop at: aClass