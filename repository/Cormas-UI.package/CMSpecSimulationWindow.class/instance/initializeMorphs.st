initialization
initializeMorphs

	self simulateButton: self defineScenarioButtonMorph asSpecAdapter.	
	self replayButton: self replayAStoredSimButtonMorph asSpecAdapter.
	self backwardAllButton: self replaySimBackwardButtonMorph asSpecAdapter.
	self backwardStepButton: self run1StepBackwardButtonMorph asSpecAdapter.
	self forwardStepButton: self exec1StepButtonMorph asSpecAdapter.
	self forwardAllButton: self runAllSimButtonMorph asSpecAdapter.
	self replayStepButton: self replay1StoredStepButtonMorph asSpecAdapter.
	self replayAllButton: self replayStoredSimButtonMorph asSpecAdapter.
