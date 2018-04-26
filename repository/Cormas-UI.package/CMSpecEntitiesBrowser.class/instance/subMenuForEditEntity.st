accessing-menu
subMenuForEditEntity

	^ MenuModel new
		addGroup: [ : group |
			group 
				addItem: [ : item | 				
					item
						name: self translator tAttributes;
						action: [ self openEditAttributes ] ];
				addItem: [ : item | 
					item 
						name: self translator tMethods;
						action: [ self entityEditMethods ] ];
				addItem: [ : item | 
					item 
						name: self translator tActivityDiagrams;
						action: [ self entityEditActivityDiagrams ] ];
				addItem: [ : item | 
					item 
						name: self translator tPoVSetter;
						action: [ self entityEditPoVSetter ] ] ]
