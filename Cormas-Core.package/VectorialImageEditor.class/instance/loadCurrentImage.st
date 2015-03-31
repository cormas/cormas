interface opening
loadCurrentImage
	
	(self observer imageOS model isKindOf: VectorialPOV)
		ifTrue: [self loadImage: (self observer imageOS model copy scaledBy: 2)]
		ifFalse: [self loadDefaultImage]