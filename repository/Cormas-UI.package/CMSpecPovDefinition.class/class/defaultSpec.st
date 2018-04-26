specs
defaultSpec

    <spec>
    ^ SpecLayout composed
		newRow: [ : r | 
			r
				add: #methodsList;
				add: #symbolsList ]