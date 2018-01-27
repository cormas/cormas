star moving
moveW
"Purpose: moves westward if neighbourW exists (raster grid), do not move otherwise"
	
	(self patch notNil and: [self patch neighbourW notNil])
		ifTrue: [self moveTo: self patch neighbourW]