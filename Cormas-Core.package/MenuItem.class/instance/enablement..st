enabled/disabled
enablement: enablement
	
	enablement isSymbol
		ifTrue: [self enablementSelector: enablement]
		ifFalse:
			[enablement == nil
				ifTrue: [self enabled: true]
				ifFalse: [self enabled: enablement]]