specs
defaultSpec
	<spec: #default>

	^ SpecLayout composed
		newColumn: [ : r | 
			r 
				newRow: [ : col | col 
					add: #rbTypeGroup ] height: 300;
				add: #entityName height: self toolbarHeight + 5;
				add: #toolbar height: self toolbarHeight ];	
	yourself	