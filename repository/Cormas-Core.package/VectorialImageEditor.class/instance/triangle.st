actions
triangle
	
	| image |
	image := (VectorialElementaryPOV newNbSegments: 3) scaledBy: 1.5.
	image sizeRatio: 1.
	self loadImage: image