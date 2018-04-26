specs
defaultSpec
	<spec: #default>

	^ SpecLayout composed
		newColumn: [ : r | 
			r 
				newRow: [ : col | col 
					add: #rbEntityElementType;
					add: #rbCellGroup ] height: 60;
				newRow: [ : col | col
					add: #rbConfigGroup ];
				add: #entityName height: self toolbarHeight + 5;
				add: #toolbar height: self toolbarHeight ];	


	yourself	