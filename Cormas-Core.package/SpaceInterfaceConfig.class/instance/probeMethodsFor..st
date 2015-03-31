access methods
probeMethodsFor: aClass
	
	| aSet |
	(self probeMethods keys includes: aClass)
		ifFalse:
			[aSet := aClass probes.
			self probeMethods at: aClass put: aSet].
	^self probeMethods at: aClass