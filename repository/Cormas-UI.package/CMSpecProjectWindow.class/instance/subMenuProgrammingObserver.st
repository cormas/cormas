submenu-programming
subMenuProgrammingObserver

	^ MenuModel new
		addGroup: [ : group |
			group 
				addItem: [ : item | self subMenuProgrammingProbes: item ] ];
		addGroup: [ : group | 
			group
				addItem: [ : item | self subMenuProgrammingMessages: item ] ];
		addGroup: [ : group | 
			group
				addItem: [ : item | self subMenuProgrammingSpaceAndEntities: item ] ]