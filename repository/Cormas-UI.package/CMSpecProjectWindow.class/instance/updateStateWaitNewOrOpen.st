callbacks
updateStateWaitNewOrOpen
	" Private - See superimplementor's comment "

	self flag: #toBeReviewed. "Apparently menugroupmorph does not disable correctly "
	super updateStateWaitNewOrOpen.
	self 
		menuDisableProgrammingGroup;
		menuDisableSimulationGroup;
		menuDisableToolsGroup;
		menuDisableVisualizationGroup;
		menuDisableHelpGroup
