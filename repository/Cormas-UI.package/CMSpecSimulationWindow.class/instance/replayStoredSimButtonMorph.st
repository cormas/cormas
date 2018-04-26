morphic
replayStoredSimButtonMorph

	^ IconicButton new
		target: self;
		actionSelector: #replayStoredSimAction;
		labelGraphic: (self iconNamed: #replayStoredSimIcon);
		color: Color transparent;
		borderColor: Color purple;
		borderWidth: 1;
		helpText: 'Replay stored simulation';
		yourself.