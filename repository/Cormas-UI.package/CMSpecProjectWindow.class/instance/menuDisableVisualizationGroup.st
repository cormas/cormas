menu
menuDisableVisualizationGroup
	" Private - Disable all menu items within the Visualization group "

	{ 
		#tProbes .
		#tMessages .
		#tSpaceEntities
	} do: [ : itemSel | self menuDisableItem: itemSel ]
