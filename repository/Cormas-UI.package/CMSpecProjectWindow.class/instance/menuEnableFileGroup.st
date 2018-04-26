menu
menuEnableFileGroup
	" Private - Enable all menu items within the File group "

	{ 
		#tClose .
		#tSave .
		#tSaveAs .
		#tExplore .
		#tRemove .
"		#tRename .
		#tRenameAs ."
		#tProperties
	} do: [ : itemSel | self menuEnableItem: itemSel ]