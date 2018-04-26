actions
square
	
	| image |
	image := (VectorialElementaryPOV newNbSegments: 4) scaledBy: 1.5.
	image sizeRatio: 1.
	self loadImage: image