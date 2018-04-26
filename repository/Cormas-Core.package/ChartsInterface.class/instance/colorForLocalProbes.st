accessing
colorForLocalProbes
	
	^colorForLocalProbes
		ifNil:
			[colorForLocalProbes := Dictionary new.
			self initColorForLocalProbes]