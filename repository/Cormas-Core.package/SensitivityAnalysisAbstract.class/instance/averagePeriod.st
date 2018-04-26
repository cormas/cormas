accessing
averagePeriod
	
	^averagePeriod
		ifNil:
			[averagePeriod := List
				with: 0
				with: self finalStep value]