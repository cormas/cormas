test
estPresent: unNiveau
	
	^oneLevel | (higherLevels & (unNiveau >= level))
		| (higherLevels not & (unNiveau = level))