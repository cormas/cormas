submenu-programming
subMenuProgrammingSimulationOrganisation

	^ MenuModel new
		addGroup: [ : group |
			group 
				addItem: [ : item | self subMenuProgrammingSimInitialInstantiation: item ] ];
		addGroup: [ : group | 
			group
				addItem: [ : item | self subMenuProgrammingSimScheduler: item ] ]