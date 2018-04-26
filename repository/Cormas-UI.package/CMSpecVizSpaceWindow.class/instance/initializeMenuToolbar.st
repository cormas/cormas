initialization
initializeMenuToolbar
	" Private - See superimplementor's commen "

	menuToolbar := MenuModel new
		addGroup: [ : group | 
			group
				addItem: [ : item | 
					item 
						name: self translator tEnvironment;
						subMenu: self initializeEnvironmentMenuToolbar ];					
				addItem: [ : item | 
					item 
						name: self translator tPoV;
						subMenu: self initializeToolsMenuToolbar ];			
				addItem: [ : item |
					item 
						name: self translator tDisplayLegends;
						subMenu: self initializeOptionMenuToolbar ];
				addItem: [ : item | 
					item 
						name: self translator tTools;
						subMenu: self initializeToolsMenuToolbar ]
					 ].
	menuToolbar applyTo: self.
