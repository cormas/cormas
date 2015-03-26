accessing
colorForGlobalProbes
	
	^colorForGlobalProbes
		ifNil:
			[colorForGlobalProbes := Dictionary new.
			self initColorForGlobalProbes]