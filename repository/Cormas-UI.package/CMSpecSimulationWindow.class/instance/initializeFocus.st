initialization
initializeFocus
	" Private - See superimplementor's comment "

	self focusOrder
		add: self closeButton;
		add: self changeButton;
		add: self initializeSimButton;
		add: self replayButton;
		add: self backwardAllButton;
		add: self backwardStepButton;
		add: self currentStepInputText;
		add: self replayStepForwardButton;
		add: self replayRunForwardButton;
		add: self runStepByStepButton;
		add: self runButton;
		add: self finalStepInputText