star moving
moveS
"Purpose: moves southward if neighbourS exists (raster grid with square cells), do not move otherwise"
	
	(self patch notNil and: [self patch neighbourS notNil])
		ifTrue: [self moveTo: self patch neighbourS]