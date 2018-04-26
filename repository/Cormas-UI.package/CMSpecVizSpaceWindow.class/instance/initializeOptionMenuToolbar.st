initialization
initializeOptionMenuToolbar
	" Private - See superimplementor's commen "

	^ MenuModel new
		addGroup: [ : group | 
			group
				addItem: [ : item | 
					item 
						name: self translator tUnmoveableZoom;
						action: [  ] ];
				addItem: [ : item | 
					item 
						name: self translator tMoveableZoom;
						action: [  ] ] ];
		addGroup: [ : group |
			group
				addItem: [ : item | 
					item 
						name: self translator tSetTrackLength;
						action: [  ] ];
				addItem: [ : item | 
					item 
						name: self translator tEnableUndoRedo;
						action: [  ] ] ];
		addGroup: [ : group | 
			group
				addItem: [ : item | 
					item 
						name: self translator tTouchpad;
						action: [  ] ] ];
		yourself
