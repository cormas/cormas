star moving
moveNW
"Purpose: moves northwestward if neighbourNW exists (raster grid with hexagons or 8-neighbours squares), do not move otherwise"
	
	(self patch notNil and: [self patch neighbourNW notNil])
		ifTrue: [self moveTo: self patch neighbourNW]