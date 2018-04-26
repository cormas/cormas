model scheduling
openParametersWin
	
	^self simManager isNil
		ifTrue: [nil]
		ifFalse: [self simManager open]