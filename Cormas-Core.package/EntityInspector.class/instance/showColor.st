actions
showColor
	
	self showInstance ~= #color
		ifTrue:
			[self showInstance = #selection ifTrue: [linkedSI drawing clearSelections].
			self showInstance: #color.
			self updateMenu.
			self updateInstanceShow]