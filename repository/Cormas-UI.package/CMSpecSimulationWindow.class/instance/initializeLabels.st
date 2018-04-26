initialization
initializeLabels

	self simulateLabel 
		label: self translator tSimulate;
		color: Color red.
	self replayLabel 
		label: self translator tReplay;
		color: Color purple.

	self finalStepLabel label: self translator tFinalStep.
	self currentStepLabel label: self translator tCurrentStep.
	self initializeLabel label: self translator tInitialize.
	self backwardLabel label:  self translator tBackwardLabel.
	self forwardLabel label: self translator tForwardLabel.