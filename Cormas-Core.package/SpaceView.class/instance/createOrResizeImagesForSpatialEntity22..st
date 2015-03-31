aVirer
createOrResizeImagesForSpatialEntity22: aClass
	"Set the images of all instances of aClass. The image is equal to the 'coordinates' of each entity scaled to the window size. The image is stored into entityImages (an identityDictionary )."
	
	(self entityImages includesKey: aClass)
		ifFalse: [self createImagesForSpatialEntity: aClass]
		ifTrue:
			[self resizeImagesOfSpatialEntitiesFromOldBounds: self buffer bounds]