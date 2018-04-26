morphic
replayAStoredSimButtonMorph

	^ IconicButton new
		target: self;
		actionSelector: #replayAStoredSimAction;
		labelGraphic: (self iconNamed: #replayAStoredSimIcon);
		color: Color transparent;
		borderColor: Color purple;
		borderWidth: 1;
		helpText: 'Replay a stored simulation';
		yourself.