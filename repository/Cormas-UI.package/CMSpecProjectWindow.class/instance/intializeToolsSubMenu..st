initialization
intializeToolsSubMenu: group

	group
		addItem: [ : item | 
			item
				name: self translator tTools;
				subMenu: self subMenuForTools ]