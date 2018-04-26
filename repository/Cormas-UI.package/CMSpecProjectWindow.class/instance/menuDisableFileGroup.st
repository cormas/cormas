menu
menuDisableFileGroup
	" Private - Disable all menu items within the File group "

	{ 
		#tClose .
		#tSave .
		#tSaveAs .
		#tExplore .
		#tRemove .
"		#tRename .
		#tRenameAs ."
		#tProperties
	} do: [ : itemSel | self menuDisableItem: itemSel ]