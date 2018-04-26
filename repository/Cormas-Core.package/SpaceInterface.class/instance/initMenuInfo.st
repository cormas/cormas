menu-info
initMenuInfo
	"Set the 'Display' info and Track menu of the Grid.
a selection of one of this item calls the method displayEntity: aClass pov: aSymbol"
	
	| aMenuBuilder menuUpdated oldItems |
	aMenuBuilder := MenuBuilder new.
	self
		addSubMenuInfoTo: aMenuBuilder
		from: (self spatialClassesForMenu: #info) asList.
	self
		addSubMenuInfoTo: aMenuBuilder
		from: (self socialClassesForMenu: #info) asList.
	self
		addSubMenuInfoTo: aMenuBuilder
		from: (self passiveClassesForMenu: #info) asList.
	menuUpdated := self setCheckInfo: aMenuBuilder menu.
	oldItems := self menuInfo menuItems.	"oldItems do: [:item | (self menuHolder value atNameKey: #pov ) submenuHolder removeItem: item]."
	oldItems do: [:item | self menuInfo removeItem: item].	"	(self menuHolder value atNameKey: #pov) submenuHolder addPart: menuUpdated."
	self menuInfo addPart: menuUpdated