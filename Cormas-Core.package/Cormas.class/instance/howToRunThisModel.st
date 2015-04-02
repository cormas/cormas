main menu
howToRunThisModel
	
	self cormasModelClass isNil not
		ifTrue: [self cormasModelClass howToRunIt]
		ifFalse:
			[self
				warn:
					(UserMessage defaultString: 'Select or create a model' key: #noModel)]