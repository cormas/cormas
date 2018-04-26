enabled/disabled
enablementSelector
	
	^adornment == nil
		ifTrue: [nil]
		ifFalse: [adornment enablementSelector]