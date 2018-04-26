submenu-programming
subMenuForProgramming

	^ MenuModel new
		addGroup: [ : group |
			group addItem: [ : item | self subMenuProgrammingEntityClass: item ] ];
		addGroup: [ : group | 
			group addItem: [ : item | self subMenuProgrammingSimulationOrganisation: item ] ];
		addGroup: [ : group | 
			group addItem: [ : item | self subMenuProgrammingObserver: item ] ];
		addGroup: [ : group |
			group addItem: [ : item | self subMenuProgrammingUML: item ] ]