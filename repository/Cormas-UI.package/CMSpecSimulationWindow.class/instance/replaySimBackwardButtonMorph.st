morphic
replaySimBackwardButtonMorph

	^ IconicButton new
		target: self;
		actionSelector: #replaySimBackwardAction;
		labelGraphic: (self iconNamed: #replaySimBackwardIcon);
		color: Color transparent;
		borderColor: Color purple;
		borderWidth: 1;
		helpText: 'Replay simulation backward';
		yourself.