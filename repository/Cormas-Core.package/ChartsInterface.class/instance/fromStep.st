aspects
fromStep
	
	fromStep isNil ifTrue: [^fromStep := 0 asValue].
	fromStep value < 0 ifTrue: [^fromStep value: 0].
	fromStep value > (self nbPts - 2)
		ifTrue: [^fromStep value: (self nbPts - 2 max: 0)].
	^fromStep