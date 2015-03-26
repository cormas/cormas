image processing
magnifiedBy: scale
	
	^self species
		on: (self image magnifiedBy: scale)
		rendered: self conversionMessage