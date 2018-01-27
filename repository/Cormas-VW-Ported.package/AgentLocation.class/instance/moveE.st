star moving
moveE
"Purpose: moves eastward if neighbourE exists (raster grid), do not move otherwise"
	
	(self patch notNil and: [self patch neighbourE notNil])
		ifTrue: [self moveTo: self patch neighbourE]