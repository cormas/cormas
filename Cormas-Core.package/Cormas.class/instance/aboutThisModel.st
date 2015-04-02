main menu
aboutThisModel
	
	self cormasModelClass isNil not
		ifTrue: [self cormasModelClass aboutIt]
		ifFalse: [self warn: 'Select or create a model']