star moving
moveN
"Purpose: moves northward if neighbourN exists (raster grid with square cells), do not move otherwise"
	
	(self patch notNil and: [self patch neighbourN notNil])
		ifTrue: [self moveTo: self patch neighbourN]