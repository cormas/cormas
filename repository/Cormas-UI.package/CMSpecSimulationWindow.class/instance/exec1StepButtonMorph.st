morphic
exec1StepButtonMorph

	^ IconicButton new
		target: self;
		actionSelector: #exec1StepAction;
		labelGraphic: (self iconNamed: #exec1StepIcon);
		color: Color transparent;
		borderColor: Color red;
		borderWidth: 1;
		helpText: 'Execute 1 step';
		yourself.