morphic
replayStepForwardButtonMorph
	^ IconicButton new
		target: self;
		actionSelector: #replayStepForwardAction;
		labelGraphic: (self iconNamed: #replayStepForwardIcon);
		color: Color transparent;
		borderColor: Color purple;
		borderWidth: 1;
		helpText: 'Replay 1 stored step';
		yourself