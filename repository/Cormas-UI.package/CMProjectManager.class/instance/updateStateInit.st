callbacks
updateStateInit
	" Private - Handle the open application event "

	super updateStateInit.
	self projectWindow
		menuDisableProgrammingGroup;
		menuDisableVisualizationGroup;
		menuDisableSimulationGroup;
		menuDisableToolsGroup;
		menuDisableHelpGroup.