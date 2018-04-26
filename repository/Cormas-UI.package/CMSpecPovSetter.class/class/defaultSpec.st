specs
defaultSpec

    <spec>
    ^ SpecLayout composed
		newColumn: [ : d |
			d newRow: [ : r |
					r 
						add: #povDefinitionLabel;
						add: #povInfoLabel
					 ] height: self toolbarHeight.
			d newColumn: [ : c |
				c newRow: [ : r | 
					r
						add: #povDefinition;
						add: #povInfo ] height: 230;
					newRow: [ : r |
					r
						add: #setColorLabel width: 70;
						add: #povColorButton ] height: self toolbarHeight;
					newRow: [ : r |
					r
						add: #applyButton width: 100 ] height: self toolbarHeight ] ]; 
		yourself