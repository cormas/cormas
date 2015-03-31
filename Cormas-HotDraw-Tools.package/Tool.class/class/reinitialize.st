class initialization
reinitialize
	"Tool reinitialize"
	
	| oldStates |
	oldStates := States.
	[self initializeStates] ifCurtailed: [States := oldStates]