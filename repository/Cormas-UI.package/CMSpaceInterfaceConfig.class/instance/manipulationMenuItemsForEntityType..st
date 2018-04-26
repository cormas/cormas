overwrite spaceInterface
manipulationMenuItemsForEntityType: aClass
	" Returns the set of methods defined in the habitus for manipulating the selected entity"
	
	(self manipEntitiesList list includes: aClass)
		ifTrue:
			[^(self manipMethodsFor: aClass)
				collect: [:aSymbol | aSymbol asString -> (aClass -> aSymbol)]]
		ifFalse: [^Array new]