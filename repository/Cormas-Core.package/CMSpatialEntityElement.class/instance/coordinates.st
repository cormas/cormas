- environment - sensing - space
coordinates
	"Purpose: Returns the coordinates x and y as a Point instance.
Example: self coordinates dist: (self neighbourNE coordinates)"
	
	^Point
		x: self numCol
		y: self numLine