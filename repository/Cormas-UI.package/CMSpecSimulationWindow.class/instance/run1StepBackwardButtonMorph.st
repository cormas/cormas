morphic
run1StepBackwardButtonMorph

	^ IconicButton new
		target: self;
		actionSelector: #run1StepBackwardAction;
		labelGraphic: (self iconNamed: #run1StepBackwardIcon);
		color: Color transparent;
		borderColor: Color purple;
		borderWidth: 1;
		helpText: 'Return 1 step backward';
		yourself.