changing
connectionStatusChanged
	
	self
		updateWidget: #connectButton
		label: ('<1?Disconnect:Connect>' expandMacrosWith: self connected).
	self
		updateStatus: #pingServerStatus
		toColor: (self statusColorFor: self connected)
		immediate: true.
	self updateWidgets