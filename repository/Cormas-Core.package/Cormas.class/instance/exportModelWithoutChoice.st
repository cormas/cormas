model saving&loading ST
exportModelWithoutChoice
	
	self cormasModelClass notNil
		ifTrue:
			[self stFile.
			self saveVisualStates]