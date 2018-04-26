submenu-simulation
subMenuForSimCrossedSensitivityAnalysis

	^ MenuModel new
		addGroup: [ : group |
			group 	
				addItem: [ : item | self subMenuSimCrossedSensSequentialValues: item ];
				addItem: [ : item | self subMenuSimCrossedSensPredefinedValues: item ] ]