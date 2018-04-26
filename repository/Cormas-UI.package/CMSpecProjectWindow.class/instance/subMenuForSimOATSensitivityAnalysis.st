submenu-simulation
subMenuForSimOATSensitivityAnalysis

	^ MenuModel new
		addGroup: [ : group |
			group 	
				addItem: [ : item | self subMenuSimOATSensSequentialValues: item ];
				addItem: [ : item | self subMenuSimOATSensPredefinedValues: item ];
				addItem: [ : item | self subMenuSimOATSensMC: item ] ];
		addGroup: [ : group | 
			group
				addItem: [ : item | self subMenuSimOATSensByParams: item ] ]			