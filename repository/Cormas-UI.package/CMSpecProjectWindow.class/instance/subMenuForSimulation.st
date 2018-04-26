submenu-simulation
subMenuForSimulation

	^ MenuModel new
		addGroup: [ : group |
			group 
				addItem: [ : item | self subMenuSimInterface: item ];
				addItem: [ : item | self subMenuSimDisplayParams: item ];
				addItem: [ : item | self subMenuSimInformation: item ] ];
		addGroup: [ : group | 
			group
				addItem: [ : item | self subMenuSimAnalysis: item ] ]