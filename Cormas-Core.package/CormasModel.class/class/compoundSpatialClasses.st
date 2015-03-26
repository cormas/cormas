managing classes
compoundSpatialClasses
	
	^self spatialClasses select: [:i | i inheritsFrom: SpatialEntitySet]