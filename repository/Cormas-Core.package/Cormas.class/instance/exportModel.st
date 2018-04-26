main menu
exportModel
	
	self cormasModelClass notNil
		ifTrue:
			[self exportModelWithChoice.
			self saveVisualStates]