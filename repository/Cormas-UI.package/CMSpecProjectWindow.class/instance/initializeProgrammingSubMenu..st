initialization
initializeProgrammingSubMenu: group

	group
		addItem: [ : item | 
			item
				name: self translator tProgramming;
				subMenu: self subMenuForProgramming ]