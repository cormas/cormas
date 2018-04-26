menu
menuDisableHelpGroup
	" Private - Disable all menu items within the Help group "

	{ 
		#tAboutModel .
		#tHowToRunModel .
		#tChangeModelComments
	} do: [ : itemSel | self menuDisableItem: itemSel ]