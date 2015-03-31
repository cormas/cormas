access methods
attributesFor: aClass
	
	(self attributes keys includes: aClass)
		ifFalse:
			[self attributes
				at: aClass
				put: (DefaultAttributesSetter attributsFromClass: aClass) sorted].
	^self attributes at: aClass