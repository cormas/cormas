menu-symbol
updateMenuAddSameAs
	"a selection of one of this item create a new symbol which shape is a copy of the selected item"
	
	self visualizedEntities
		do:
			[:aClass | 
			self menuAddSameAs
				removeItem: (self menuAddSameAs menuItemLabeled: aClass name asString)].
	self initMenuAddSameAs