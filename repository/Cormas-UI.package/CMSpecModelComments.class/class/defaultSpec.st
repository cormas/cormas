specs
defaultSpec

	^ SpecLayout composed
		newColumn: [ : c  |
				c newRow: [ : s |
					s
						add: #versionName;
						add: #creationDate ] height: self toolbarHeight;
				add: #authorList;
				add: #modelText;
				add: #toolbar height: self toolbarHeight ];
		yourself 
		
		
		