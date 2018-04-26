menu-info
initMenuDelimitor
	"Set the delimitor menu of the Grid.
a selection of one of this item calls the method displayEntity: aClass pov: aSymbol"
	"set the sub menu 'trackAgents'"
	
	| menuDelimitor menuDyn spatialClasses |
	spatialClasses := List new.
	spatialClasses := self spatialClassesForMenu: #delimitor.
	menuDyn := self menuHolder value atNameKey: #celldelimitation.
	menuDelimitor := Menu new.
	1
		to: spatialClasses size
		do:
			[:i | 
			| aClass |
			aClass := spatialClasses at: i.
			menuDelimitor
				addItemLabel: aClass name
				value: [self trackAgents: aClass]].
	menuDyn submenu: menuDelimitor