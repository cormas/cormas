updating
updateDisplay
	
	super updateDisplay.
	self isEditing ifFalse: [self updateSelection]