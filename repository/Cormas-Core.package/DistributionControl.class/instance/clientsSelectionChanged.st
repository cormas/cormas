changing
clientsSelectionChanged
	
	self
		enable: #(#removeClientButton #pingClientButton)
		if: clients selectionIndex ~= 0.
	self
		updateStatus: #pingClientStatus
		toColor: ColorValue gray
		immediate: true