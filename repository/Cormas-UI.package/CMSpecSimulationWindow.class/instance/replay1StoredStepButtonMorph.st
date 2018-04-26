morphic
replay1StoredStepButtonMorph

	^ IconicButton new
		target: self;
		actionSelector: #replay1StoredStepAction;
		labelGraphic: (self iconNamed: #replay1StoredStepIcon);
		color: Color transparent;
		borderColor: Color purple;
		borderWidth: 1;
		helpText: 'Replay 1 stored step';
		yourself.