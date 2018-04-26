access methods
infoMethodsFor: aClass
	
	| aSet |
	(self infoMethods keys includes: aClass)
		ifFalse:
			[aSet := aClass availableInfo.
			aSet remove: #nil.
			self infoMethods
				at: aClass
				put: aSet sorted].
	^self infoMethods at: aClass