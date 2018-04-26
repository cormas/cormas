overwrite spaceInterface
buildManipulationMenu: aMenuBuilder forEntity: aClass
	" Add to the menu the set of methods defined into 'methodsForManipulation' method. 
	The key will appear as the menu item. The selected method will be executed by the agent if the item is selected."
	
	(self manipMethodsFor: aClass)
		do: [:aSymbol | aMenuBuilder add: aSymbol asString -> aSymbol].
	^aMenuBuilder