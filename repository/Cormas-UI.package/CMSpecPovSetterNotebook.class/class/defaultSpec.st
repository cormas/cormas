specs
defaultSpec
	<spec>

	^ SpecLayout composed
		newRow: [ : col | 
			col
				add: #tabManager ]