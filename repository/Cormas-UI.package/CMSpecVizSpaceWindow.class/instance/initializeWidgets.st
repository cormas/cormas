initialization
initializeWidgets
	" Private - See superimplementor's comment "

	self initializeApplication.
	super initializeWidgets.
	self initializeMenuToolbar.
	self setFocusOrder.