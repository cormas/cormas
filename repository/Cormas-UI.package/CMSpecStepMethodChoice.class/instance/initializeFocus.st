initialization
initializeFocus
	" Private - See superimplementor's comment "

	self focusOrder
		add: self methodsLabeledList;
	add: self finalStepLabeledTextInput;
	add: self randomnessCheckbox;
	add: self toolbar. 