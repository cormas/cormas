menu
menuDisableProgrammingGroup
	" Private - Disable all menu items within the Programming group "

	{ 
		#tProgrammingEntityClass .
		#tEditInit .
		#tEditAttributes .
		#tEditSteps .
		#tEditActivityDiagrams .
		#tProbes .
		#tMessages .
		#tSpaceEntities
	} do: [ : itemSel | self menuDisableItem: itemSel ]