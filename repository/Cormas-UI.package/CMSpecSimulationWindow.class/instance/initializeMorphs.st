initialization
initializeMorphs
	self initializeSimButton: self defineScenarioButtonMorph asSpecAdapter.
	self replayButton: self replayAStoredSimButtonMorph asSpecAdapter.
	self backwardAllButton: self replaySimBackwardButtonMorph asSpecAdapter.
	self backwardStepButton: self run1StepBackwardButtonMorph asSpecAdapter.
	self runStepByStepButton: self runStepByStepButtonMorph asSpecAdapter.
	self runButton: self runButtonMorph asSpecAdapter.
	self replayStepForwardButton: self replayStepForwardButtonMorph asSpecAdapter.
	self replayRunForwardButton: self replayRunForwardButtonMorph asSpecAdapter