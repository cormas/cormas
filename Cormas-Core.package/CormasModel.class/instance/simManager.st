accessing
simManager
	
	^simManager
		ifNil:
			[simManager := SimManager new.
			simManager cormasModel: self]