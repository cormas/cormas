submenu-programming
subMenuForSimInitInstantiation

	^ MenuModel new
		addGroup: [ : group |
			group 
				addItem: [ : anItem | self subMenuSimEditInitialization: anItem ];
				addItem: [ : anItem | self subMenuSimEditAttributes: anItem ] ]
		

