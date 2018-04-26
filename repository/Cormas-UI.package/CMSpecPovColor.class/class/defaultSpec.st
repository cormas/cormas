specs
defaultSpec

    <spec>
    ^ SpecLayout composed
		newColumn: [ : c | 
			c
				add: #colorChooser;
				add: #applyButton height: self toolbarHeight ]