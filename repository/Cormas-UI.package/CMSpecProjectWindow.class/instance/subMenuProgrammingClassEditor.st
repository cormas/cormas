submenu-programming
subMenuProgrammingClassEditor

	^ MenuModel new
		addGroup: [ : group |
			group addItem: [ : item | self subMenuOpenClassEditor: item ] ]
		
