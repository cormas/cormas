specs
defaultSpec
	<spec>

	^ SpecLayout composed
		newRow: [ : col | 
			col
				newColumn: [ : row |
				row 
					add: #cbComm;
					add: #cbGroup;
					add: #cbLocation ];
			newColumn: [ : row | 
				row
					add: #newClassName;
					add: #descriptionLabel;
					add: #toolbar height: self toolbarHeight ] ]