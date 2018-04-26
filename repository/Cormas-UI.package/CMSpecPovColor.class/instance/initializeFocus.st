initialization
initializeFocus
	" Private - See superimplementor's comment "

	self focusOrder
		add: self colorChooser;
	add: self applyButton. 