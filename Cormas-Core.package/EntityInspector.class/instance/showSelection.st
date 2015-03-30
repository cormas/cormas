actions
showSelection
	
	self showInstance ~= #selection
		ifTrue:
			[self showInstance = #color ifTrue: [self removeColor].
			self showInstance: #selection.
			self updateMenu.
			self updateInstanceShow]