random
rangeConstraintsChanged
	
	self intOrFloat value = #randomFloat
		ifTrue:
			[upperConstraint value: '['.
			lowerConstraint value: ']']
		ifFalse:
			[upperConstraint value: ']'.
			lowerConstraint value: '[']