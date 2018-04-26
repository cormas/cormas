methods
resetInstanceShow
	
	self showInstance = #selection ifTrue: [linkedSI drawing clearSelections].
	self showInstance = #color ifTrue: [self removeColor]