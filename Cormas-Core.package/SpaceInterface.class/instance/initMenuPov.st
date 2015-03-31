menu-pov
initMenuPov
	"Set the PoV menu of the spatial grid. a selection of one of this item calls the method #displayEntity: aClass pov: aSymbol"
	
	| aMenuBuilder menuUpdated oldItems |
	aMenuBuilder := MenuBuilder new.
	self
		addSubMenuTo: aMenuBuilder
		from: (self spatialClassesForMenu: #pov) asList.
	self
		addSubMenuTo: aMenuBuilder
		from: (self socialClassesForMenu: #pov) asList.
	self
		addSubMenuTo: aMenuBuilder
		from: (self passiveClassesForMenu: #pov) asList.
	menuUpdated := self setCheck: aMenuBuilder menu.
	oldItems := self menuPov menuItems.	"oldItems do: [:item | (self menuHolder value atNameKey: #pov ) submenuHolder removeItem: item]."
	oldItems do: [:item | self menuPov removeItem: item].	"	(self menuHolder value atNameKey: #pov) submenuHolder addPart: menuUpdated."
	self menuPov addPart: menuUpdated