morphic
runButtonMorph
	^ IconicButton new
		target: self;
		actionSelector: #runAction;
		labelGraphic: (self iconNamed: #runSimIcon);
		color: Color transparent;
		borderColor: Color red;
		borderWidth: 1;
		helpText: 'Run simulation until final step';
		yourself