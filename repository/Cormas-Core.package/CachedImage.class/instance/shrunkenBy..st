image processing
shrunkenBy: scale
	
	^self species
		on: (self image shrunkenBy: scale)
		rendered: self conversionMessage