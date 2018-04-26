actions
showNo
	
	self showInstance ~= #no
		ifTrue:
			[self resetInstanceShow.
			self showInstance: #no.
			self updateMenu.
			self updateInstanceShow]