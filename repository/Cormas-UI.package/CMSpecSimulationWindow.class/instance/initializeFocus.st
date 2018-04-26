initialization
initializeFocus
	" Private - See superimplementor's comment "

	self focusOrder
		add: self closeButton;
	add: self changeButton;
	add: self simulateButton;
	add: self replayButton;
	add: self backwardAllButton;
	add: self backwardStepButton;
	add: self currentStepInputText;
	add: self forwardStepButton;
	add: self forwardAllButton;
	add: self replayStepButton;
	add: self replayAllButton;
	add: self finalStepInputText.. 