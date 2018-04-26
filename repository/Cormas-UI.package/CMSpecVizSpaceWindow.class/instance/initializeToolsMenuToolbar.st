initialization
initializeToolsMenuToolbar
	" Private - See superimplementor's commen "

	^ MenuModel new
		addGroup: [ : group | 
			group
				addItem: [ : item | 
					item 
						name: self translator tDisplayLegends;
						action: [  ] ];
				addItem: [ : item | 
					item 
						name: self translator tPhoto;
						action: [  ] ];
				addItem: [ : item | 
					item 
						name: self translator tVideo;
						action: [  ] ];
				addItem: [ : item | 
					item 
						name: self translator tManipulateInstances;
						action: [  ] ];
				addItem: [ : item | 
					item 
						name: self translator tCreateInstances;
						action: [  ] ];
				addItem: [ : item | 
					item 
						name: self translator tClickTo;
						action: [  ] ];
				addItem: [ : item | 
					item 
						name: self translator tHabitus;
						action: [  ] ] ];
			yourself