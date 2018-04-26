access methods
povMethodsFor: aClass
	
	| aSet |
	(self povMethods keys includes: aClass)
		ifFalse:
			[aSet := aClass availablePov.
			aSet remove: #nil.
			self povMethods
				at: aClass
				put: aSet sorted].
	^self povMethods at: aClass