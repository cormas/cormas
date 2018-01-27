star moving
moveSE
"Purpose: moves southeastward if neighbourSE exists (raster grid with hexagons or 8-neighbours squares), do not move otherwise"
	
	(self patch notNil and: [self patch neighbourSE notNil])
		ifTrue: [self moveTo: self patch neighbourSE]