morphic
runAllSimButtonMorph

	^ IconicButton new
		target: self;
		actionSelector: #runAllSimAction;
		labelGraphic: (self iconNamed: #runAllSimIcon);
		color: Color transparent;
		borderColor: Color red;
		borderWidth: 1;
		helpText: 'Run simulation until final step';
		yourself.