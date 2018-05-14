morphic
replayRunForwardButtonMorph
	^ IconicButton new
		target: self;
		actionSelector: #replayRunForwardAction;
		labelGraphic: (self iconNamed: #replayRunForwardIcon);
		color: Color transparent;
		borderColor: Color purple;
		borderWidth: 1;
		helpText: 'Replay stored simulation';
		yourself