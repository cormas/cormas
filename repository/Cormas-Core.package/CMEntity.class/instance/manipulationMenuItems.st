- manipulation
manipulationMenuItems
	" Returns a collection of associations corresponding to the methods defined into 'methodsForManipulation' method. 
	The key will appear as the menu item. The selected method will be executed by the agent if the item is selected."
	
	^self class methodsForControl
		collect: [:aSymbol | aSymbol asString -> (self class -> aSymbol)]