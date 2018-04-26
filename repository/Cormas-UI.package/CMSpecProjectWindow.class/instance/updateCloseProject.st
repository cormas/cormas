callbacks
updateCloseProject
	" Private - See superimplementor's comment "

	super updateCloseProject.
	self 
		menuDisableFileGroup;	
		menuDisableProgrammingGroup;
		menuDisableSimulationGroup;
		menuDisableToolsGroup;
		menuDisableVisualizationGroup;	
		menuDisableHelpGroup;
		updateSimulationWindow.