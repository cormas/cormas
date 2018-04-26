initialization
initializeSimulationSubMenu: group

	group
		addItem: [ : item | 
			item
				name: self translator tSimulation;
				subMenu: self subMenuForSimulation ]