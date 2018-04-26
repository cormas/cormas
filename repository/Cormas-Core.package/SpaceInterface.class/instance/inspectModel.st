menu - actions
inspectModel
	
	^Cormas isModelUserMode
		ifTrue:
			[Dialog warn:
					'Sorry, this feature is not available in a model user environment']
		ifFalse: [self cormasModel inspect]