initialization
defaultSpec
	<spec>
	^ SpecLayout composed
		newColumn: [ : row | 
			row
				add: #defineEntitiesLabel height: self toolbarHeight ];
		newRow: [ : col |
			col
				add: #spatialList;
				add: #socialList;
				add: #passiveList ]
