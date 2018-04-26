menu
menuEnableVisualizationGroup
	" Private - Disable all menu items within the Visualization group "

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