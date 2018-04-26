menu
menuEnableHelpGroup
	" Private - Enable all menu items within the Tools group "

	{ 
		#tAboutModel .
		#tHowToRunModel .
		#tChangeModelComments	
	} do: [ : itemSel | self menuEnableItem: itemSel ]