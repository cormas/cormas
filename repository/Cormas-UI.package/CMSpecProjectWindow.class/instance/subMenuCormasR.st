submenu-simulation
subMenuCormasR

	^ MenuModel new
		addGroup: [ : group |
			group 
				addItem: [ : item | self subMenuStartWSR: item ];
				addItem: [ : item | self subMenuStopWSR: item ] ]