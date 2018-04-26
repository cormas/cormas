specs
defaultSpec
	<spec>
	
	^ SpecLayout composed newRow: [ : r |
			r
				add: #authorName;
				add: #authorEmail;
				add: #ok width: 35;
				add: #removeButton width: 35 ]				
			height: 25;
		yourself