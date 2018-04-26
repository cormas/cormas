initialization
initializeWidgets
	" Private - See superimplementor's comment "

	self initializeApplication.
	super initializeWidgets.
	self simWindow: ((CMSpecSimulationContainer for: self projectManager)
		owner: self;
		yourself)
