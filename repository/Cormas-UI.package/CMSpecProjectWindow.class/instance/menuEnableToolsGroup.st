menu
menuEnableToolsGroup
	" Private - Enable all menu items within the Tools group "

	{ 
		#tManipulateInstances .
		#tCreateInstances .
		#tSnapshot .
		#tModelListing .
		#tModelGlossary .
		#tDisplayModelVersions .
		#tDistributeAsServer .
		#tDistributeAsClient .
		#tPackageClient
	} do: [ : itemSel | self menuEnableItem: itemSel ]