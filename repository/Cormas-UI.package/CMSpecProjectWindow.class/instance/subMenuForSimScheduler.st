submenu-programming
subMenuForSimScheduler

	^ MenuModel new
		addGroup: [ : group |
			group 
				addItem: [ : anItem | self subMenuSimEditSteps: anItem ];
				addItem: [ : anItem | self subMenuSimEditActivityDiagrams: anItem ] ]
		

