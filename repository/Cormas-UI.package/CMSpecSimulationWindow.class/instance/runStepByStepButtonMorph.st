morphic
runStepByStepButtonMorph

	^ IconicButton new
		target: self;
		actionSelector: #runStepByStepAction;
		labelGraphic: (self iconNamed: #runStepByStepSimIcon);
		color: Color transparent;
		borderColor: Color red;
		borderWidth: 1;
		helpText: 'Execute 1 step';
		yourself.