initialization
initializeMenuToolbar
	" Private - See superimplementor's commen "

	menuToolbar := MenuModel new
		addGroup: [ : group | 
			self initializeFileSubMenu: group.
			self initializeProgrammingSubMenu: group.
			self initializeVisualizationSubMenu: group.
			self initializeSimulationSubMenu: group.
			self intializeToolsSubMenu: group.
			self initializeHelpMenu: group ];
		addGroup: [ : group |
			"self initializeFileToolbarButtons: group.			"
			self initializeActionsButtons: group ].
	menuToolbar applyTo: self.