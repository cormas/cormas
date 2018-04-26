access methods
manipMethodsFor: aClass
	
	(self manipMethods keys includes: aClass)
		ifFalse:
			[self manipMethods
				at: aClass
				put: aClass methodsForControl].
	^self manipMethods at: aClass