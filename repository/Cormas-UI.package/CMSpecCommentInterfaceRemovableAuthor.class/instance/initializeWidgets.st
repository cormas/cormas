initialization
initializeWidgets
	" Private - See superimplementor's comment "

	super initializeWidgets.
	self initializeRemoveButton.
	self focusOrder
		add: self authorName;
		add: self authorEmail;
		add: self ok;
		add: self removeButton