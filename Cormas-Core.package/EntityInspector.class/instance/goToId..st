actions
goToId: nb
	
	object := EntityReference
		on:
			(self entitiesCollec
				detect: [:e | e id = nb]
				ifNone:
					[^self cormas
						warn: 'no <1s> id=<2p> exists'
						with: object class name
						with: nb]).
	self resetInstanceShow.
	self updateValues.
	self updateInstanceShow