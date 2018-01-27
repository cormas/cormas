star moving
moveNE
"Purpose: moves northeastward if neighbourNE exists (raster grid with hexagons or 8-neighbours squares), do not move otherwise"
	
	(self patch notNil and: [self patch neighbourNE notNil])
		ifTrue: [self moveTo: self patch neighbourNE]