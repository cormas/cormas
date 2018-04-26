accessing
legend
	
	^legend
		ifNil:
			[self initLegend.
			legend]