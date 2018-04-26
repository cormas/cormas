accessing
checks
	"return all checks..
	Subclass should redefines the method initializeChecks"
	
	^checks
		ifNil:
			[checks := OrderedCollection new.
			self initializeChecks.
			checks]