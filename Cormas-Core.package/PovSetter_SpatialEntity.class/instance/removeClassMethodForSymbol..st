saving&removing pov symbols
removeClassMethodForSymbol: aSymbol
	
	selectedClass class
		removeSelector: ('SpatialEntityPOV_' , aSymbol) asSymbol