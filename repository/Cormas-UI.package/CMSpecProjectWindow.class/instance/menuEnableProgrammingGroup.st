menu
menuEnableProgrammingGroup
	" Private - Enable all menu items within the Programming group "

	{ 
		#tProgrammingEntityClass .
		#tEditInit .
		#tEditAttributes .
		#tEditSteps .
		#tEditActivityDiagrams .
		#tProbes .
		#tMessages .
		#tSpaceEntities
	} do: [ : itemSel | self menuEnableItem: itemSel ]