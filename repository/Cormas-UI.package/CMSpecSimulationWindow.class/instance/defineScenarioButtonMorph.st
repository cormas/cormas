morphic
defineScenarioButtonMorph

	^ IconicButton new
		target: self;
		actionSelector: #defineScenarioAction;
		labelGraphic: (self iconNamed: #defineScenarioIcon);
		color: Color transparent;
		borderColor: Color red;
		borderWidth: 1;
		helpText: 'Define the scenario';
		yourself.