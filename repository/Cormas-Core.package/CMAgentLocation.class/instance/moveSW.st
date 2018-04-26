star moving
moveSW
"Purpose: moves southwestward if neighbourSW exists (raster grid with hexagons or 8-neighbours squares), do not move otherwise"
	
	(self patch notNil and: [self patch neighbourSW notNil])
		ifTrue: [self moveTo: self patch neighbourSW]