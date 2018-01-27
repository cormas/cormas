init
openScenarioBuilderWin
	
	self terminateAllProcesses.
	self initScenarioWindow.
	self openInterface: #scenarioBuilderInterface.
	self changedRandomSeed