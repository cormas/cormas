specs
defaultSpec
	<spec: #default>

	^ SpecLayout composed
		newColumn: [ : r | 
			r 
				newRow: [ : col | col 
					add: #fixRandomSeedCheck ;					
					add: #fixRandomTextField ] height: self toolbarHeight; 
				newRow: [ : col |
					col
						newColumn: [ : row |
							row
								add: #initMethodList;
								add: #controlMethodList;
								add: #finalStep height: self toolbarHeight ];
						newColumn: [ : row |
							row
								add: #probesList;
								add: #stepBackCheck height: self toolbarHeight ] ];
				add: #toolbar height: self toolbarHeight ];	
	yourself	