initialization
initializeFocus

	self focusOrder
		add: self setterAccessorCheckbox;
		add: self getterAccessorCheckbox;
		add: self notifyObsCheckbox;
		add: self initialRBGroup;
		add: self toolbar