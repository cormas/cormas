saving&removing pov symbols
removeClassMethodForSymbol: aSymbol
	
	selectedClass class removeSelector: ('ArcPOV_' , aSymbol) asSymbol