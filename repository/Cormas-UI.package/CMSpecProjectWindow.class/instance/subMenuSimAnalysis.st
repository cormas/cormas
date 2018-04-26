submenu-simulation
subMenuSimAnalysis

	^ MenuModel new
		addGroup: [ : group |
			group 
				addItem: [ : item | self subMenuSimStochasticAnalysis: item ];
				addItem: [ : item | self subMenuSimOATSensitivityAnalysis: item ];
				addItem: [ : item | self subMenuSimCrossedSensitivityAnalysis: item ] ];
		addGroup: [ : group | 
			group
				addItem: [ : item | self subMenuSimCormasR: item ] ]