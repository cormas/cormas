callbacks
updateStateOpened
	" Private - See superimplementor's comment "

	super updateStateOpened.
	self 
		menuEnableProgrammingGroup;
		menuEnableSimulationGroup;
		menuEnableToolsGroup;
		menuEnableVisualizationGroup;
		menuEnableHelpGroup;
		updateSimulationWindow