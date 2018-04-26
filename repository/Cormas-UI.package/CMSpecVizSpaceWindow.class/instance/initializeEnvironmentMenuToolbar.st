initialization
initializeEnvironmentMenuToolbar
	" Private - See superimplementor's commen "

	^ MenuModel new
		addGroup: [ : group | 
			group
				addItem: [ : item | 
					item 
						name: self translator tNew;
						subMenu: self subMenuForNew ];
				addItem: [ : item | 
					item 
						name: self translator tLoad;
						subMenu: self subMenuForLoad ] ];
		addGroup: [ : group | 
			group
				addItem: [ : item | 
					item 
						name: self translator tModify;
						subMenu: self subMenuForModify ];
				addItem: [ : item | 
					item 
						name: self translator tReOpen;
						action: [ self reOpen ] ] ];
		addGroup: [ : group | 
			group
				addItem: [ : item | 
					item 
						name: self translator tClose;
						action: [ self close ] ] ]