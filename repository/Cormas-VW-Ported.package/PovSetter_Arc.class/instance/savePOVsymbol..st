saving&removing pov symbols
savePOVsymbol: aSymbol
	
	self
		saveArcPOV: imageOS model copy
		intoClass: selectedClass
		symbol: aSymbol